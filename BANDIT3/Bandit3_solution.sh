#!/usr/bin/expect

set timeout 30
set host "bandit.labs.overthewire.org"
set username "bandit3"
set password "MNk8KNH3Usiio41PRUEoDFPqfxLPlSmx"
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
send "ls -a\r"
expect "$ "
send "cat ...Hiding-From-You\r"
expect "$ "
interact
