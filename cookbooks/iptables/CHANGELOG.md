# CHANGELOG

## 0.1.25
remove reference to external Palladian server from sbc_a.erb

## 0.1.24
remove references to external clamav servers from rules.v4.erb and rules.v4.fe.erb
updated rules.v4.fe.erb for use in s1&s2

## 0.1.23:
added smtp profile


## 0.1.22:

added access rules for sip over port 5062 for T sipProfile.

## 0.1.21:

added AirBNB interface rules to sbc_t rules file

## 0.1.20:

added AirBNB interface rules to RTP_X rules file

## 0.1.19:

added script to enable iptables logging 'cos i'm too lazy to remember the command.

## 0.1.18:

added fix SBC_a iptables recipe to allow for correct variable names to be used.

## 0.1.17:

added new SBC_a iptables recipe to allow for correct hearbeat ports and to allow for easier cross site deployment

## 0.1.16:

add fe_default rules for FE servers

## 0.1.15:

Correct rtpport slection for rtp_x control port add missing bracket.

## 0.1.14:
Add Sip access to management box for T sbcs in template not .txt! 


## 0.1.13:
Add Sip access to management box for T sbcs

## 0.1.12:
Add control ports for BT MPLS to 9000:9222

## 0.1.11:
increase range for RTP ports to 65535 in rtp_x file.

## 0.1.10:
increase range for RTP ports to 65535 in rtp_v file.
## 0.1.9:
fixes permission on init script for Tsbc rule set.
## 0.1.8:
added iptables recipe for t_sbc with environmental variable look.
added control ports 9000-9222 to rtp_v recipe

## 0.1.6:
Correct Name of s1sbc_a init file.

## 0.1.0:

* Initial release of iptables

- - -
Check the [Markdown Syntax Guide](http://daringfireball.net/projects/markdown/syntax) for help with Markdown.

The [Github Flavored Markdown page](http://github.github.com/github-flavored-markdown/) describes the differences between markdown on github and standard markdown.
