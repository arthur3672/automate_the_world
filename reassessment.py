#!/usr/bin/python3

import xml.etree.ElementTree as ET
import os
import argparse

def passed(message):
	message = '\033[92m'+message+'\033[0m'
	return message

def failed(message):
	message = '\033[91m'+message+'\033[0m'
	return message

def compare(old_result, new_result):
	i = 0
	while i < len(old_result):
		plugin_id = old_result[i][0]
		plugin_name = old_result[i][1]
		affected_host = old_result[i][2]
		print('%s - %s' % (plugin_id, plugin_name))
		passed = True
		for j in range(0, len(new_result)):
			if plugin_id == new_result[j][0]:
				if affected_host == new_result[j][2]:
					passed = False
		if passed == True:
			status = 'Solved'
			print(passed('%s - %s' % (affected_host, status)))
		else:
			status = 'Not Solved'
			print(failed('%s - %s' % (affected_host, status)))
		same = True
		while same:
			if len(old_result) - i > 1:
				if old_result[i][0] == old_result[i+1][0]:
					i += 1
					affected_host = old_result[i][2]
					passed = True
					for j in range(0, len(new_result)):
						if plugin_id == new_result[j][0]:
							if affected_host == new_result[j][2]:
								passed = False
					if passed == True:
						status = 'Solved'
						print(passed('%s - %s' % (affected_host, status)))
					else:
						status = 'Not Solved'
						print(failed('%s - %s' % (affected_host, status)))
				else:
					same = False
			else:
				same = False
		i += 1
	exit()

def main(nessus_file):
	result = list()
	tree = ET.parse(nessus_file)
	root = tree.getroot()[1]
	total_hosts = len(root)
	for i in range(0, total_hosts):
		target_ip = root[i].attrib['name']
		total_findings = len(root[i])
		for j in range(1, total_findings):
			risk_factor = root[i][j].find('risk_factor').text
			if (risk_factor != 'None'):
				plugin_id = root[i][j].attrib['pluginID']
				name = root[i][j].attrib['pluginName']
				affected_host = str(target_ip)+':'+root[i][j].attrib['port']+' ('+root[i][j].attrib['protocol'].upper()+')'
				result.append([plugin_id, name, affected_host])
	return result

if __name__ == '__main__':
	parser = argparse.ArgumentParser()
	parser.add_argument('-f', metavar='Initial Nessus File / Directory', type=str, help='Initial Nessus File / Directory', required=True)
	parser.add_argument('-n', metavar='Reassessment Nessus File', type=str, help='Reassessment Nessus File to compare', required=True)

	args = parser.parse_args()
	old_output = list()
	if os.path.isdir(args.f):
		if args.f.endswith('/') == False:
			args.f += '/'
		for filename in os.listdir(args.f):
			if filename.endswith('.nessus'):
				old_file = args.f + filename
				old_output += main(old_file)
	else:
		old_file = args.f
		old_output = main(old_file)
	
	new_output = list()
	if os.path.isdir(args.n):
		if args.n.endswith('/') == False:
			args.n += '/'
		for filename in os.listdir(args.n):
			if filename.endswith('.nessus'):
				new_file = args.n + filename
				new_output += main(new_file)
	else:
		new_file = args.n
		new_output = main(new_file)

	old_output.sort()
	new_output.sort()
	compare(old_output, new_output)