#!/usr/bin/expect

set timeout 30
set host "bandit.labs.overthewire.org"
set username "bandit14"
set password "MU4VWeTyJk8ROof1qqmcBPaLh7lDCPvS"
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

send "echo $password | nc localhost 30000\r"
expect "$ "



interact
