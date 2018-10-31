#!/bin/bash

i3-msg "append_layout /home/pmouthaan/.i3/chatspace.json"
i3-msg "exec /usr/bin/chromium-browser https://mail.google.com/mail/u/0/?tab=cm#inbox;"
i3-msg "exec /usr/bin/slack --role slack"
i3-msg "exec /usr/bin/xfce4-terminal --role telegram -x ~/Documents/self/tg/bin/telegram-cli"
i3-msg "exec /usr/bin/xfce4-terminal --role fbchat -x /usr/bin/irssi"
