#!/usr/bin/expect

set timeout 30
set host "bandit.labs.overthewire.org"
set username "bandit0"
set password "bandit0"
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

send "cat readme\r"
expect "$ "

interact