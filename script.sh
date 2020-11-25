#!/usr/bin/expect

set host [lindex $argv 0]

spawn telnet [lindex $host]
expect assword:
send qmnpear2k10\r
expect >
send en\r
expect assword:
send qmnpear2k10\r
expect #
send "conf t\r"
expect #
send "service timestamps log datetime localtime\r"
expect #
send "service timestamps debug datetime localtime\r"
expect #
send "exit\r"
expect #
send "wr\r"
expect #
send "exit\r"
