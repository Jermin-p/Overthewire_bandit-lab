#!/usr/bin/expect

set timeout 30
set host "bandit.labs.overthewire.org"
set username "bandit9"
set password "4CKMh1JI91bUIZZPXDqGanal4xvAg0JM"
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
send  "strings data.txt | grep '==='\r"
expect "$ "

interact
