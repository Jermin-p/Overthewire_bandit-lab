#!/usr/bin/expect

set timeout 30
set host "bandit.labs.overthewire.org"
set username "bandit7"
set password "morbNTDkSW6jIlUc0ymOdMaLnOlFVAaj"
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
send  "cat data.txt | grep 'millionth'\r"
expect "$ "

interact
