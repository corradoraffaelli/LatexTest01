#!/bin/bash
FILE_NAME=$1

pdffonts $FILE_NAME.pdf 
pdf2ps $FILE_NAME.pdf $FILE_NAME.ps
ps2pdf14 -dPDFSETTINGS=/prepress -dEmbedAllFonts=true $FILE_NAME.ps $FILE_NAME.pdf
