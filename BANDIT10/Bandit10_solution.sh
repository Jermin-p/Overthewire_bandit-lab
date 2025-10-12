#!/usr/bin/expect

set timeout 30
set host "bandit.labs.overthewire.org"
set username "bandit10"
set password "FGUW5ilLVJrxX9kMYMmlN4MgbpfMiqey"
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



send "ls  -a\r"
expect "$ "
send  "base64 -d data.txt\r"
expect "$ "

interact
