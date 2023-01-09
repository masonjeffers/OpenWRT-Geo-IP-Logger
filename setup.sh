#!/bin/bash
# Install the rsyslog package
opkg update
opkg install rsyslog

# Enable the rsyslog service
/etc/init.d/rsyslog enable

# Configure rsyslog to log SSH messages to a separate file
cat >> /etc/rsyslog.conf <<EOF

# Log SSH messages to a separate file
auth,authpriv.* /var/log/ssh.log
EOF

# Restart the rsyslog service to apply the new configuration
/etc/init.d/rsyslog restart
