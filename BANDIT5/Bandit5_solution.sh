#!/usr/bin/expect

set timeout 30
set host "bandit.labs.overthewire.org"
set username "bandit5"
set password "4oQYVPkxZOOEOO5pTW81FB8j8lxXGUQw"
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



send "ls -a\r"
expect "$ "
send "cd inhere\r"
expect "$ "
send "ls  -a\r"
expect "$ "
send  "find . -type f -size 1033c\r"
expect "$ "
send "cat ./maybehere07/.file2\r"
expect "$ "

interact
