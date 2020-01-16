#!python3

import os
import sys
import csv
import argparse
import io
 


if __name__ == "__main__":

    list_ip_port_protocol = []
    list_ip_port = []

    parser = argparse.ArgumentParser()
    parser.add_argument("-f", dest="source_csv_file_path", metavar = "Source CSV File (csv)", help="File path to the source CSV.", required=True)
    parser.add_argument("-p", dest="plugin_id", metavar = "Plugin ID", help="Plugin ID to retrieve", required=True)
    #parser.add_argument("-o", dest="destination_text_file_path", metavar = "Destination Text File (txt)", help="File path to the destination txt", required=True)
   
    args = parser.parse_args()
    
    source_csv_file_path = str(os.path.abspath(args.source_csv_file_path))
    plugin_id = str(args.plugin_id)
    #destination_text_file_path = str(os.path.abspath(args.destination_text_file_path))
    
    source_csv_file = csv.reader(open(source_csv_file_path), delimiter=',')
    
    source_csv_file_top_row = next(source_csv_file)
    
    plugin_id_column_index = source_csv_file_top_row.index("Plugin ID")
    host_column_index = source_csv_file_top_row.index("Host")
    port_column_index = source_csv_file_top_row.index("Port")
    protocol_column_index = source_csv_file_top_row.index("Protocol")
    
    for row in source_csv_file:
        if row[plugin_id_column_index] == plugin_id:
            host = row[host_column_index]
            port = row[port_column_index]
            protocol = row[protocol_column_index]
        
            list_ip_port_protocol.append(host +  ":" + port + " (" + protocol.upper() + ")")
            
    source_csv_file = csv.reader(open(source_csv_file_path), delimiter=',')
    
    for row in source_csv_file:
        if row[plugin_id_column_index] == plugin_id:
            host = row[host_column_index]
            port = row[port_column_index]
            protocol = row[protocol_column_index]
            
            list_ip_port.append(host +  ":" + port)
            
            
            
    list_ip_port_protocol = set(list_ip_port_protocol)
    list_ip_port = set(list_ip_port)
    
    
    for element in list_ip_port_protocol:
        print(element)
        
    
    print("======================================")
    
        
    for element in list_ip_port:
        print(element)