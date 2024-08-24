### Bind

# shift + arrow up
bind -k sr "cd ..; commandline -f repaint"
# shift + arrow down
bind -k sf "cd (ls -d */ | fzf); commandline -f repaint"

# shift + arrow left
bind -k sleft "prevd ; commandline -f repaint"
# shift + arrow right
bind -k sright "nextd ; commandline -f repaint"