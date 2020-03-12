#!/bin/sh

cat > /etc/ssmtp/ssmtp.conf << EOF
root=postmaster
mailhub=$SMTP_HOST:$SMTP_PORT
hostname=`hostname`
FromLineOverride=YES
EOF

cat > /app/mail.txt << EOF
To: $SENDMAIL_TO_ADDR
From: $SENDMAIL_FROM_ADDR
Subject: Test Mail with SSMTP

Hello, this is a test mail.
EOF

ssmtp $SENDMAIL_TO_ADDR < /app/mail.txt