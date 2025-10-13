#!/usr/bin/expect

set timeout 30
set host "bandit.labs.overthewire.org"
set username "bandit12"
set password "7x16WNeHIi5YkIhWsfFIqoognUTyj9Q4"
set port "2220"
set temp_folder_name "pechcawt"

spawn ssh -p $port $username@$host
expect {
    "password:" {
        send "$password\r"
    }
    "yes/no" {
        send "yes\r"
        expect "password:"
        send "$password\r"
    }
}
expect "$ "



send "ls  -a\r"
expect "$ "
send "mkdir /tmp/$temp_folder_name\r"
expect "$ "
send "cp data.txt /tmp/$temp_folder_name\r"
expect "$ "
send " cd /tmp/$temp_folder_name\r"
expect "$ "
send  "cat data.txt | xxd -r > data\r"
expect "$ "
send  "file data\r"
expect "$ "
send  "echo decompress the file 'data' for several times depending on the file type\r"
expect "$ "

interact
