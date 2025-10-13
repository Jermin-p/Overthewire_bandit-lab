#!/usr/bin/expect

set timeout 30
set host "bandit.labs.overthewire.org"
set username "bandit16"
set password "kSkvUpMQ7lBYyCM4GBPvCvT1BfWRy0Dx"
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

interact
