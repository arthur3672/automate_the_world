<<<<<<< HEAD:extras/repetitive_command_aid.py
#!python3

import os
import sys
import random
import string
import re
import argparse
import subprocess
import threading
#from queue import Queue
from multiprocessing import Process, JoinableQueue

# Change Log
# Add MULTITHREADING
# Added limmit of threads
# Removed Multithreading -> Added Multiprocessing
# As for now, recommended to use 8 processes, or the number of logical processors given to your vm or pc (python -c 'import multiprocessing; print(multiprocessing.cpu_count())')
# To check available processes spawnable -> [cat /proc/sys/kernel/pid_max] or [ulimit -a] (Find for 'max user processes') && (It is recommended to follow the limit shown by ulimit -a)
# 
# TODO 
# Add multiprocessing
#
#
# BUGS
#
# BUG FIXED
# -> Multithreading results in the terminal unresponsive after completion, this not sure, tested on repetitive_command_aid.py  (Terminal can be used but commands not shown)
#
#
#
#

def os_command_thread(queue_handler):
    while not queue_handler.empty():
        work = queue_handler.get()
        
        command_result_output_file_path = work['command_result_output_file_path']
        command = work['command']

        f = open(command_result_output_file_path, "w")
        f.write("[Command] " + command + '\n')
        f.write(os.popen(command).read())
        f.close()
        queue_handler.task_done()
    return True


 
def randomString(stringLength=5):
    """Generate a random string of fixed length """
    letters = string.ascii_lowercase + string.ascii_uppercase + string.digits
    return ''.join(random.choice(letters) for i in range(stringLength))

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("-c",  dest="command", metavar = "Command to Execute", help="Full command to execute where IP Address is prefixed with \"IP_ADDRESS\" and Port is prefixed with \"PORT\"", required=True)
    parser.add_argument("-iL", dest="ip_list", metavar = "IP List", help="IP List for the command seperate each ip with newlines with this format (192.168.1.1:443)", required=True)
    parser.add_argument("-t", dest="max_threads", metavar = "Max Threads", help="The default maximum concurrent threads (Recommended: 8). To find out the highest available threads, keep fuzzing until your system hangs/slows down.", required=True)

    args = parser.parse_args()
    
    IP_List_File_Path = os.path.abspath(args.ip_list)
    original_command = str(args.command)
    
    f = open(IP_List_File_Path, "r")
    ip_list = f.read()
    f.close()
    
    directory_count = 1
    output_file_path=""
    while True:
        output_file_path = "Repetitive_Command_Aid_" +  str(directory_count)
        directory_count += 1
        if not (os.path.isdir(output_file_path)):
            break
    os.mkdir(output_file_path)

    f=open(output_file_path + "/" + output_file_path + "_command.txt","w")
    f.write(original_command)
    f.close()

    plugin_id = 0

    #Multithreading here
    queue_handler = JoinableQueue(maxsize=0)
    max_threads = int(args.max_threads)

    for line in ip_list.splitlines():
        target_ip = line.split(':')[0]
        target_port = line.split(':')[1]
        

        
        
        command_result_output_file_path = output_file_path + "/" + target_ip + "_" + target_port + ".txt"

        command = original_command.replace("IP_ADDRESS", target_ip)
        command = command.replace("PORT", target_port)
        command = command.replace('PLUGIN', str(plugin_id))
        command = command.replace('PATH', str(command_result_output_file_path))

        command = command + " 2>&1"

        # Add command to queue handler
        queue_handler.put({'command_result_output_file_path' : command_result_output_file_path, 'command' : command})

    # Execute queue handler with the max amount of threads
    for i in range(max_threads):
        print("Thread " + str(i + 1) + " started.")
        worker = Process(target=os_command_thread, args=(queue_handler, ))
        #worker.setDaemon(True)    
        worker.start()

    queue_handler.join()
    print("Done")
    return



if __name__ == "__main__":
    main()
    sys.exit(0)
    
=======
#!python3

import os
import sys
import random
import string
import re
import argparse
import subprocess
import threading
#from queue import Queue
from multiprocessing import Process, JoinableQueue

# Change Log
# Add MULTITHREADING
# Added limmit of threads
# Removed Multithreading -> Added Multiprocessing
# As for now, recommended to use 8 processes, or the number of logical processors given to your vm or pc (python -c 'import multiprocessing; print(multiprocessing.cpu_count())')
# To check available processes spawnable -> [cat /proc/sys/kernel/pid_max] or [ulimit -a] (Find for 'max user processes') && (It is recommended to follow the limit shown by ulimit -a)
# 
# TODO 
# Add multiprocessing
#
#
# BUGS
#
# BUG FIXED
# -> Multithreading results in the terminal unresponsive after completion, this not sure, tested on repetitive_command_aid.py  (Terminal can be used but commands not shown)
#
#
#
#

def os_command_thread(queue_handler):
    while not queue_handler.empty():
        work = queue_handler.get()
        
        command_result_output_file_path = work['command_result_output_file_path']
        command = work['command']

        f = open(command_result_output_file_path, "w")
        f.write("[Command] " + command + '\n\n')
        f.write(os.popen(command + " 2>&1").read())
        f.close()
        queue_handler.task_done()
    return True


 
def randomString(stringLength=5):
    """Generate a random string of fixed length """
    letters = string.ascii_lowercase + string.ascii_uppercase + string.digits
    return ''.join(random.choice(letters) for i in range(stringLength))

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("-c",  dest="command", metavar = "Command to Execute", help="Full command to execute where IP Address is prefixed with \"IP_ADDRESS\" and Port is prefixed with \"PORT\"", required=True)
    parser.add_argument("-iL", dest="ip_list", metavar = "IP List", help="IP List for the command seperate each ip with newlines with this format (192.168.1.1:443)", required=True)
    parser.add_argument("-t", dest="max_threads", metavar = "Max Threads", help="The default maximum concurrent threads (Recommended: 8). To find out the highest available threads, keep fuzzing until your system hangs/slows down.", required=True)
    parser.add_argument("-p", dest="plugin_id", metavar = "Plugin ID", help="The Plugin ID for the commands.", required=True)


    args = parser.parse_args()
    
    IP_List_File_Path = os.path.abspath(args.ip_list)
    original_command = str(args.command)
    plugin_id = str(args.plugin_id)
    
    f = open(IP_List_File_Path, "r")
    ip_list = f.read()
    f.close()
    
    directory_count = 1
    output_file_path=""
    while True:
        output_file_path = "Repetitive_Command_Aid_" +  str(directory_count)
        directory_count += 1
        if not (os.path.isdir(output_file_path)):
            break
    os.mkdir(output_file_path)

    f=open(output_file_path + "/" + output_file_path + "_command.txt","w")
    f.write(original_command)
    f.close()


    #Multithreading here
    queue_handler = JoinableQueue(maxsize=0)
    max_threads = int(args.max_threads)

    for line in ip_list.splitlines():
        target_ip = line.split(':')[0]
        target_port = line.split(':')[1]
        

        
        
        command_result_output_file_path = output_file_path + "/" + plugin_id + "_" + target_ip + "_" + target_port + ".txt"

        command = original_command.replace("IP_ADDRESS", target_ip)
        command = command.replace("PORT", target_port)
        command = command.replace('PLUGIN', str(plugin_id))
        command = command.replace('RANDOM_PATH', output_file_path + "/" + plugin_id + "_" + target_ip + "_" + target_port + "_TEMP.txt")


        # Add command to queue handler
        queue_handler.put({'command_result_output_file_path' : command_result_output_file_path, 'command' : command})

    i=0
    # Execute queue handler with the max amount of threads
    for i in range(max_threads):
        print("Thread " + str(i + 1) + " started.")
        worker = Process(target=os_command_thread, args=(queue_handler, ))
        #worker.setDaemon(True)    
        worker.start()

    queue_handler.join()
    print("Done")
    return



if __name__ == "__main__":
    main()
    sys.exit(0)
    
>>>>>>> ed55d1f0cac69ad356c07c569d1e7c1344421554:repetitive_command_aid.py
