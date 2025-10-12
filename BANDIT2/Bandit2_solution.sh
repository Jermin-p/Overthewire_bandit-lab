#!/usr/bin/expect

set timeout 30
set host "bandit.labs.overthewire.org"
set username "bandit2"
set password "263JGJPfgU6LtdEvgfWU1XP5yac29mFx"
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

send "cat ./'--spaces in this filename--'\r"
expect "$ "

interact
