#!/usr/bin/python3
import requests
import argparse
import threading
import queue
import time
import random
from datetime import datetime
import xml.etree.ElementTree as ET
import mysql.connector
import string
import os
import settings

exit_flag = 0
error_plugin_list = []

class my_thread (threading.Thread):
	def __init__(self, thread_name, working_queue):
		threading.Thread.__init__(self)
		self.thread_name = thread_name
		self.working_queue = working_queue

	def run(self):
		process_data(self.thread_name, self.working_queue)
		
def process_data(thread_name, working_queue):
	while not exit_flag:
		queue_lock.acquire()
		if not work_queue.empty():
			work = working_queue.get()
			plugin_id = work['plugin_id']
			target_host = work['target_host']
			target_port = work['target_port']
			target_protocol = work['target_protocol']

			message = '%s for Plugin ID: %s; Host: %s; Port: %s\n%s' % (thread_name, plugin_id, target_host, target_port, time_elapsed())
			print(good_msg(message))

			# Start processing the stuff here
			conn = settings.db()
			mycursor = conn.cursor(prepared=True)
			sql = 'SELECT * FROM `plugin` INNER JOIN `command` ON `plugin`.`command_id` = `command`.`command_id` WHERE `plugin`.`plugin_id` = %s'
			mycursor.execute(sql, (plugin_id, ))
			result = mycursor.fetchall()

			parent_directory = autorun_output_file_path + "/" + str(plugin_id) + "/"
			if not (os.path.isdir(parent_directory)):
				os.mkdir(parent_directory)

			if mycursor.rowcount == 0:
				if plugin_id not in error_plugin_list:
					error_plugin_list.append(plugin_id)
					error(plugin_id, target_host, target_port, target_protocol)
					error_file = parent_directory + "ERROR_" + str(plugin_id) + ".txt"
					if not (os.path.isfile(error_file)):
						f = open(error_file, "a+")
						f.write("Error Plugin ID: " + str(plugin_id) + " is missing from database.")
						f.close()
			else:
				command = result[0][3].decode('utf-8')
				destination_text_file_path = parent_directory + str(plugin_id)+'_' + str(target_host)+'_'+str(target_port) + '.txt'

				if '\r' in command:
					command = command.replace('\r', '')
				if '\n' in command:
					command = command.replace('\n', '')
				if 'IP_ADDRESS' in command:
					command = command.replace('IP_ADDRESS', str(target_host))
				if 'PORT' in command:
					command = command.replace('PORT', str(target_port))
				if 'PLUGIN' in command:
					command = command.replace('PLUGIN', str(plugin_id))
				if 'RANDOM_PATH' in command:
					target_txt_file = '%s_%s_%s_TEMP.txt' % (plugin_id, target_host, target_port)
					random_path = '"' + parent_directory + target_txt_file + '"'
					command = command.replace('RANDOM_PATH', random_path)

				task_left = work_queue.qsize()
				task_completed = total_tasks - task_left

				if not (os.path.exists(destination_text_file_path)):
					# Do not change this part, create a file for better debugging when a thread hangs/wont terminate
					f = open(destination_text_file_path, "w")
					f.write("[Command] " + command + '\n\n')
					f.write(os.popen(command + " 2>&1").read())
					f.close()
					message = 'Completed command for Plugin ID: %s; Host: %s; Port: %s; Task Left: %s; Task Completed: %s\n%s' % (plugin_id, target_host, target_port, task_left, task_completed, time_elapsed())
					print(good_msg(message))
				else:
					message = 'Skipped executing Plugin ID: %s because the validation check already exists for specific host: %s:%s\n%s' % (plugin_id, target_host, target_port, time_elapsed())
					print(warning_msg(message))
			# End processing the stuff here
		queue_lock.release()
		time.sleep(1)

def error(plugin_id, target_host, target_port, target_protocol):
	f = open('plugin_check_output.txt', 'a+')
	f.close()
	if str(plugin_id) not in open('plugin_check_output.txt').read():
		f = open('plugin_check_output.txt', 'a+')
		row = str(plugin_id)+' - '+str(target_host)+':'+str(target_port)+' ('+str(target_protocol).upper()+')\r\n'
		f.write(row)
		f.close()
	message = 'Error Detected on Plugin ID '+str(plugin_id)+', please check on plugin_check_output.txt for more information\n'+time_elapsed()
	print(error_msg(message))

def good_msg(message):
	message = '\033[1;32;40m'+message
	return message

def warning_msg(message):
	message = '\033[1;33;40m'+message
	return message

def error_msg(message):
	message = '\033[1;31;40m'+message
	return message

def time_elapsed():
	end_time = datetime.now()
	time_taken = end_time - start_time
	message = 'Total Time Elapsed: '+str(time_taken)
	return message

parser = argparse.ArgumentParser()
parser.add_argument('-f', metavar='Nessus File', type=str, help='raw Nessus file to do verification', required=True)
parser.add_argument('-t', metavar='Threads', type=int, help='no of threads to run', required=False, default=10)

args = parser.parse_args()
nessus_file = args.f
total_thread = args.t
total_tasks = 0

start_time = datetime.now()
message = "Autorun started on: " + str(start_time)
print(good_msg(message))

output_directory_name = os.path.splitext(os.path.basename(nessus_file))[0]
directory_count = 1
while True:
	autorun_output_file_path = output_directory_name + "_" +  str(directory_count)
	directory_count += 1
	if not (os.path.isdir(autorun_output_file_path)):
		break
os.mkdir(autorun_output_file_path)

queue_lock = threading.Lock()
work_queue = queue.Queue(maxsize=0)
threads = []

# Fill the queue
queue_lock.acquire()

tree = ET.parse(nessus_file)
root = tree.getroot()[1]
total_hosts = len(root)
for i in range(0, total_hosts):
	target_host = root[i].attrib['name']
	total_findings = len(root[i])
	for j in range(1, total_findings):
		findings = list()
		risk_factor = root[i][j].find('risk_factor').text
		if (risk_factor != 'None'):
			plugin_id = root[i][j].attrib['pluginID']
			target_port = root[i][j].attrib['port']
			target_protocol = root[i][j].attrib['protocol']
			total_tasks += 1

			work_queue.put({'plugin_id': plugin_id, 'target_host': target_host, 'target_port': target_port, 'target_protocol': target_protocol})

queue_lock.release()

# Create new threads
for i in range(0, total_thread):
	thread_name = 'Thread-'+str(i)
	thread = my_thread(thread_name, work_queue)
	thread.start()
	threads.append(thread)

# Wait for queue to empty
while not work_queue.empty():
	pass

# Notify threads it's time to exit
exit_flag = 1

# Wait for all threads to complete
for t in threads:
	t.join()

print(good_msg('Completed!\n' + time_elapsed()))