#!/usr/bin/expect

set timeout 30
set host "bandit.labs.overthewire.org"
set username "bandit6"
set password "HWasnPhtq9AVKe0dmk45nxy20cvUa6EG"
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



send "cd ..\r"
expect "$ "
send "cd ..\r"
expect "$ "


send "ls  -a\r"
expect "$ "
send  "find . -size 33c -name 'bandit7*' 2>/dev/null\r"
expect "$ "
send "cat ./var/lib/dpkg/info/bandit7.password\r"
expect "$ "

interact
