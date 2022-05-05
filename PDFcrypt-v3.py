import sys
from tkinter import filedialog as fd
import tkinter as tk
import getpass
import PyPDF2
import getpass
from time import sleep
import os

def select_file():
    filetypes = (
        ('PDF files', '*.pdf'),
        ('All files', '*.*')
    )
    root = tk.Tk()
    root.overrideredirect(1)
    root.withdraw()
    fpath = fd.askopenfilename(
        title = 'Select a file',
        #initialdir = '/',
        filetypes = filetypes
    )
    root.destroy()
    if fpath == "":
        exit()
    else:
        return fpath

def encrypt(fpath, pw):
    pwi = getpass.getpass()
    if not pw == pwi:
        #print("Wrong password!")
        sleep(1)
        return False
    pdfWriter = PyPDF2.PdfFileWriter()
    try:
        for pageNum in range(pdfReader.numPages):
            pdfWriter.addPage(pdfReader.getPage(pageNum))
    except PyPDF2.utils.PdfReadError:
        return False
    pdfWriter.encrypt(pw)
    resultPdf = open(fpathii + "_encrypted.pdf", "wb")
    pdfWriter.write(resultPdf)
    resultPdf.close()
    return True

def decrypt(fpath, pw):
    pdfReader.decrypt(pw)
    pdfWriter = PyPDF2.PdfFileWriter()
    try:
        for pageNum in range(pdfReader.numPages):
            pdfWriter.addPage(pdfReader.getPage(pageNum))
    except PyPDF2.utils.PdfReadError:
        return False
    resultPdf = open(fpathii + "_decrypted.pdf", "wb")
    pdfWriter.write(resultPdf)
    resultPdf.close()
    return True

if len(sys.argv) < 2:
    fpath = select_file()
else:
    fpath = sys.argv[1]

pdfFile = open(fpath, "rb")
pdfReader = PyPDF2.PdfFileReader(pdfFile)
fpathi = fpath.split(".")
fpathi.pop(len(fpathi) - 1)
fpathii = ""
for x in fpathi:
    fpathii = fpathii + x
    if len(fpathii) < len(fpathi):
        fpathii = fpathii + "."

if __name__ == '__main__':
    while True:
        pw = getpass.getpass()
        if pdfReader.isEncrypted:
            if decrypt(fpath, pw):
                print("File decrypted!")
                sleep(1)
                break
            else:
                print("Wrong password! Try again.")
        else:
            if encrypt(fpath, pw):
                print("File encrypted!")
                sleep(1)
                break
            else:
                print("Wrong password! Try again.")
pdfFile.close()
