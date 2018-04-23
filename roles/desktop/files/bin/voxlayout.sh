#!/bin/bash

# i3-msg "exec /usr/bin/spotify --role spotify"
i3-msg "append_layout /home/pmouthaan/.i3/voxbone.json"
i3-msg "exec /usr/bin/chromium-browser https://mail.google.com/mail/u/0/?tab=cm#inbox;"
i3-msg "exec /usr/bin/slack --role slack"
i3-msg "exec /usr/bin/xfce4-terminal --role fbchat"
i3-msg "exec /usr/bin/xfce4-terminal --role=twitter -x ~/bin/twat.sh"
i3-msg "exec /usr/bin/xfce4-terminal --role=telegram -x ~/Documents/self/tg/bin/telegram-cli  "
