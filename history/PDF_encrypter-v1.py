from tkinter import filedialog as fd
import PyPDF2
import getpass
def select_file():
    filetypes = (('PDF files', '*.pdf'))

    fpath = fd.askopenfilename(
        title = 'Select a file',
        initialdir = '/',
        #filetypes = filetypes
    )
    return fpath

fpath = select_file()
#fpath = input("File: ")
#fpathp = fpath + ".pdf"
pw = getpass.getpass()
pwi = getpass.getpass()
if not pw == pwi:
    print("Wrong password!")
    exit()
pdfFile = open(fpath, "rb")
pdfReader = PyPDF2.PdfFileReader(pdfFile)
pdfWriter = PyPDF2.PdfFileWriter()
for pageNum in range(pdfReader.numPages):
    pdfWriter.addPage(pdfReader.getPage(pageNum))
pdfWriter.encrypt(pw)
resultPdf = open(fpath + "_encrypted.pdf", "wb")
pdfWriter.write(resultPdf)
resultPdf.close()
