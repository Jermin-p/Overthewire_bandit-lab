#!/usr/bin/expect

set timeout 30
set host "bandit.labs.overthewire.org"
set username "bandit1"
set password "ZjLjTmM6FvvyRnrb2rfNWOZOTa6ip5If"
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

send "cat ./-\r"
expect "$ "

interact
