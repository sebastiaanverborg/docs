#!/bin/bash

cd build
ls -la
echo $FTP_USER
echo $FTP_PASSWORD
find . -type f -exec curl --ftp-create-dirs -T {} -u $FTP_USER:$FTP_PASSWORD $FTP_HOST{} \;
cd -

