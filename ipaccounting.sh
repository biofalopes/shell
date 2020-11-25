#!/usr/bin/expect

set host [lindex $argv 0]

spawn telnet [lindex 10.200.148.12]
expect ogin:
send mafra\r
expect ssword:
send joedibaitola\r
expect netuno1:/home/mafra>
send "telnet $host\r"
expect sername:
send fabio\r
expect assword:
send joedigay\r
expect >
send en\r
expect assword:
send pqpms2k3\r
expect #
send "sh ip accounting\r"
while 1 {
	expect {
		"More" {
			send " "
		}
		"#" {
			exit
		}
	}
}
