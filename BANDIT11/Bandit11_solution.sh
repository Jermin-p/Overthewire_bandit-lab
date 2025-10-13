#!/usr/bin/expect

set timeout 30
set host "bandit.labs.overthewire.org"
set username "bandit11"
set password "dtR173fZKb0RRsDFSGsg2RWnpNVj3qRr"
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
send  "cat data.txt | tr 'A-Za-z' 'N-ZA-Mn-za-m' \r"
expect "$ "

interact
