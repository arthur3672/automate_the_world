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



if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("-f",  metavar = "Source Excel File (xlsm, xlsx)", help="File path to the excel workbook.", required=True)
    parser.add_argument("-o", metavar = "Destination Word File (docx)", help="Output file to the microsoft word.", required=True)

    args = parser.parse_args()

    source_excel_workbook_file_path = os.path.abspath(args.f)
    destination_word_file_path = os.path.abspath(args.o)

    excel = win32.gencache.EnsureDispatch('Excel.Application')
    excel.Visible = False
    excel.ScreenUpdating = False
    excel.DisplayAlerts = False
    excel.EnableEvents = False
    source_workbook_win32 = excel.Workbooks.Open(source_excel_workbook_file_path)
    

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
    
    #workbook_xlrd = xlrd.open_workbook(source_excel_workbook_file_path, on_demand = True)
    
    #worksheet_sheet_names_array = workbook_xlrd.sheet_names()
    
    count = 1
    for worksheet_sheet_names in source_workbook_win32.Sheets:
        print((str(count) + ".").ljust(5) + worksheet_sheet_names.Name)
        count += 1
        
        
    source_worksheet_index = int(input("Select the worksheet to convert: "))
    
    source_worksheet_win32 = source_workbook_win32.Worksheets(source_worksheet_index)  
    
    for n, shape in enumerate(source_worksheet_win32.Shapes):
        shape.Copy()
        image = ImageGrab.grabclipboard()       
        img_bytes = io.BytesIO()
        image.save(img_bytes, format='PNG')        
        
        # Width based on A4 Size with 1 inch margin on each side
        destination_word_document.add_picture(img_bytes, width=docx.shared.Cm(15.92))
    
    destination_word_document.save(destination_word_file_path)
    
    source_workbook_win32.Close(SaveChanges=False)
    