#!/usr/bin/expect

set timeout 30
set host "bandit.labs.overthewire.org"
set username "bandit17"
set password "EReVavePLFHtFlFsjn3hyzMlvSuSAcRD"
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
