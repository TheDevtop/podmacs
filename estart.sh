#!/bin/sh
/usr/bin/emacs --daemon --no-splash --color=never
/usr/sbin/sshd -De
