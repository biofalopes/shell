#!/usr/bin/expect

set host [lindex $argv 0]

spawn telnet [lindex $host]
expect sername:
send fabio\r
expect assword:
send \r
expect >
send en\r
expect assword:
send pqpms2k3\r
expect #
send "conf t\r"
expect (config)#
send "no snmp-server host 23.11.103.4 @mplsvpn\r"
expect (config)#
send "no snmp-server host 23.11.103.5 @mplsvpn\r"
expect (config)#
send "no snmp-server host 23.11.103.6 @mplsvpn\r"
expect (config)#
send exi\r
expect #
send wr\r
expect #

exit 
