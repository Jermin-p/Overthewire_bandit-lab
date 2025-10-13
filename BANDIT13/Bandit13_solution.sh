#!/usr/bin/expect

set timeout 30
set host "bandit.labs.overthewire.org"
set username "bandit13"
set password "FO5dwFsc0cbaIiH0h8J2eUks2vdTDwAn"
set port "2220"

# First SSH connection
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

# Now we're logged in as bandit13
# Second SSH connection using the private key

send "ssh -i sshkey.private bandit14@localhost -p 2220\r"
expect {
    "yes/no" {
        send "yes\r"
        expect "$ "
    }
    "Enter passphrase" {
        # If no passphrase is needed, it should just connect
        send "\r"
        expect "$ "
    }
    "$ " {
        # Already connected
    }
}

# Now we should be bandit14
send "cat /etc/bandit_pass/bandit14\r"
expect "$ "

interact