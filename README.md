# Automate The World!

This repository is for automation and fasten up the process in working on PoC, and documentation, specifically for Internal / External VAPT

# System Requirements
- Linux (Recommended: Kali)
- MySQL
- Python 3

# What are all these?

```bash

automate_the_world/
├── autorun.py ------------------------------------> Verify all the plugin available in Database and save it to text files
├── developer_only
│   └── plugin_check.py ---------------------------> Used to check if any Nessus Plugin is available in the database or not
├── documentation
│   ├── vapt_final_report.py ----------------------> Combination of vapt_nmap.py & vapt_raw_to_xlsx.py and output to DOCX format
│   ├── vapt_nmap.py ------------------------------> Convert nmap xml file to a DOCX format
│   └── vapt_raw_to_xlsx.py -----------------------> Convert raw nessus to a XLSX format
├── extras
│   ├── Excel_Full_Worksheet_Image_to_MS_Word.py --> Move all the images from MS Excel to MS Word (all worksheet)
│   ├── Excel_One_Worksheet_Image_to_MS_Word.py ---> Move all the images from MS Excel to MS Word (1 worksheet only)
│   ├── Nessus_Plugin_ID_to_Affected_Hosts.py -----> To check which host is affected by this plugin ID
│   ├── repetitive_command_aid.py -----------------> Execute a specified command based on the specified ip address list
│   └── shellcode
│       ├── Cat_All_Files_In_Directory.sh ---------> Cat all the file content in the directory
│       ├── Grep_Commands.sh ----------------------> Grep the specific word
│       ├── Remove_Prefix_From_Files.sh -----------> Remove the first prefix. Eg: output_file.txt will become file.txt
│       └── Rename_All_Files_With_Prefix.sh -------> Rename all the file with prefix. Eg: file.txt will become output_file.txt
├── nessus.sql ------------------------------------> SQL file for the autorun.py
├── README.md
├── requirements.txt ------------------------------> Python file requirements
├── settings.py  ----------------------------------> DB settings
└── tools
    ├── houseofkeys -------------------------------> Specific for plugin ID 121008
    └── rdp-sec-check
        └── rdp-sec-check.pl ----------------------> Specific for RDP related plugin

```
# How to start?

- Clone the repository
- pip3 install -r requirements.txt
- Setup the required database information at settings.py
- To start:<br>
  - autorun.py: python3 autorun.py -f \<Raw Nessus File\> -t \<Max Threads\><br>
    - Remark: Max should be at least 4 threads lesser compare to your available logical processors. Eg: If you have 8 logical processors, then the max threads should be 4 or lesser) This can be checked using your task manager (Processor Tab) in Windows Host or execute the python command [python -c 'import multiprocessing; print(multiprocessing.cpu_count())'].<br>
    - Remark 2: Set the MySQL Max Connections to 1000.<br>
      - Increase this value in main config file (e.g., /etc/my.cnf or /etc/mysql/my.cnf) using this syntax:
```bash
[mysqld]
set-variable=max_connections=1000
```

  - Nessus_Plugin_ID_to_Affected_Hosts.py: python3 Nessus_Plugin_ID_to_Affected_Hosts.py -f \<CSV File\> -p \<Plugin ID\><br>

  - Excel_One_Worksheet_Image_to_MS_Word.py: python3 Excel_One_Worksheet_Image_to_MS_Word.py -f \<CSV File\> -o \<Output Word Document\><br>
    - Remark: Only executable from windows (Requires pywin32 library)

  - Excel_Full_Worksheet_Image_to_MS_Word.py: python3 Excel_Full_Worksheet_Image_to_MS_Word.py -f \<CSV File\><br>
    - Remark: Only executable from windows (Requires pywin32 library)

  - Cat_All_Files_In_Directory.sh: ./Cat_All_Files_In_Directory.sh <br>

  - Remove_Prefix_From_Files.sh: ./Remove_Prefix_From_Files.sh <br>

  - Rename_All_Files_With_Prefix.sh: ./Rename_All_Files_With_Prefix.sh \<PREFIX\> <br>

  - repetitive_command_aid.py: python3 repetitive_command_aid.py -iL \<IP_LIST.txt\> -c "\<COMMAND\>" <br>

  - Grep_Commands.sh: ./Grep_Commands.sh <br>

# What these python can do?

Currently they can:
- Run the script based on the plugin ID and the controlled database. (autorun.py)
- Generate document from the raw Nessus & nmap xml file  (python file in documentation folder)
- Save the output to a text file so can refer them back easily

# What these python cannot do?

- Hack the planet
- Automate every single plugin (some of them cannot be verified with this easily / they are not in database yet)
- Screenshot the output

# Terms & Conditions

- All the updated / added code shall be well commented in the commit changes part
- You are always welcome to add the issues / feature requests. We will do it only if we got the time.