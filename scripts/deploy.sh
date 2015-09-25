#!/bin/bash

cd build
ls -la
find . -type f -exec curl --ftp-create-dirs -T {} -u $FTP_USER:$FTP_PASSWORD "$FTP_HOST" \;
cd -

