#!/bin/sh
/usr/bin/emacs --daemon --no-splash --color=never --reverse-video
/usr/sbin/sshd -De
