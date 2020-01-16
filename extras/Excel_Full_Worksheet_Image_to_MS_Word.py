#!python3

import os
import sys

# pip install xlrd
import xlrd
# pip install xlwt
import xlwt
import argparse
# pip install Pillow
from PIL import ImageGrab
# pip install pywin32
import win32com.client as win32

# pip install python-docx
import docx

import io

import random
import string

import platform
import re

def randomString(stringLength=5):
    """Generate a random string of fixed length """
    letters = string.ascii_lowercase + string.ascii_uppercase + string.digits
    return ''.join(random.choice(letters) for i in range(stringLength))

if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("-f",  metavar = "Source Excel File (xlsm, xlsx)", help="File path to the excel workbook.", required=True)
   
    args = parser.parse_args()

    source_excel_workbook_file_path = os.path.abspath(args.f)

    excel = win32.gencache.EnsureDispatch('Excel.Application')
    excel.Visible = False
    excel.ScreenUpdating = False
    excel.DisplayAlerts = False
    excel.EnableEvents = False
    source_workbook_win32 = excel.Workbooks.Open(source_excel_workbook_file_path)
    
    
    #workbook_xlrd = xlrd.open_workbook(source_excel_workbook_file_path, on_demand = True)
    
    #worksheet_sheet_names_array = workbook_xlrd.sheet_names()
    
    source_workbook_win32_basename = os.path.basename(source_workbook_win32.Name)
    
    source_workbook_win32_basename = os.path.splitext(source_workbook_win32_basename)[0]
    
    directory_count = 1
    
    while True:
        output_directory_file_path = source_workbook_win32_basename + "_Screenshots_" + str(directory_count)
        directory_count += 1
        if not (os.path.isdir(output_directory_file_path)):
            break
    output_directory_file_path = os.path.abspath(output_directory_file_path)
    os.mkdir(output_directory_file_path)
    
    System_Platform = platform.system()
    
    System_Directory_String = ""
    
    if (System_Platform == "Windows"):
        System_Directory_String = "\\"
    elif (System_Platform == "Linux"):
        System_Directory_String = "/"
    else:
        System_Directory_String = "/"
    
    
    count = 1
    for worksheet_sheet_names in source_workbook_win32.Sheets:
        filtered_worksheet_sheet_name = worksheet_sheet_names.Name
        
        filtered_worksheet_sheet_name = re.sub(r"[^A-Za-z0-9]", " ", filtered_worksheet_sheet_name)
        
        destination_word_file_path = output_directory_file_path + System_Directory_String +  filtered_worksheet_sheet_name + ".docx"
    
        source_worksheet_win32 = source_workbook_win32.Worksheets(count)
        
        
        destination_word_document = docx.Document()
    
        section = destination_word_document.sections[0]
        section.page_height = docx.shared.Mm(297)
        section.page_width = docx.shared.Mm(210)
        section.left_margin = docx.shared.Mm(25.4)
        section.right_margin = docx.shared.Mm(25.4)
        section.top_margin = docx.shared.Mm(25.4)
        section.bottom_margin = docx.shared.Mm(25.4)
        section.header_distance = docx.shared.Mm(12.7)
        section.footer_distance = docx.shared.Mm(12.7)
    
        for n, shape in enumerate(source_worksheet_win32.Shapes):
            shape.Copy()
            image = ImageGrab.grabclipboard()       
            img_bytes = io.BytesIO()
            image.save(img_bytes, format='PNG')        
            
            # Width based on A4 Size with 1 inch margin on each side
            destination_word_document.add_picture(img_bytes, width=docx.shared.Cm(15.92))
        
        destination_word_document.save(destination_word_file_path)
    
        count += 1
        
        
    
    source_workbook_win32.Close(SaveChanges=False)
    
    print("Images saved to directory: " + output_directory_file_path)
    