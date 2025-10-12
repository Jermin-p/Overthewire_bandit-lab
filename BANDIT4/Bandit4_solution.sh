#!/usr/bin/expect

set timeout 30
set host "bandit.labs.overthewire.org"
set username "bandit4"
set password "2WmrDFRmJIq3IPxneAaMGhap0pFhF3NJ"
set port "2220"

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



send "ls -a\r"
expect "$ "
send "cd inhere\r"
expect "$ "
send "ls  -a\r"
expect "$ "
send  "file ./*\r"
expect "$ "
send "cat ./-file07\r"
expect "$ "

interact
