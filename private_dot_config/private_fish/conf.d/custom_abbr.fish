### Aliases

# for loop to cd into directories
abbr 4DIRS --set-cursor=! "$(string join \n -- 'for dir in */' 'cd $dir' '!' 'cd ..' 'end')"
# input last history when type `!!`
abbr -a !! --position anywhere --function last_history_item

# git
abbr ga 'git add'
abbr gaa 'git add --all'
abbr gau 'git add --update'
abbr gst "git status"
abbr gba 'git branch -a'

abbr gc 'git commit -v'
abbr gc! 'git commit -v --amend'
abbr gc!n 'git commit -v --amend --no-edit'
abbr gco "git checkout"
abbr gcp "git cherry-pick"
abbr gcount 'git shortlog -sn'

abbr gd 'git diff'
abbr gdca 'git diff --cached'
abbr gdcw 'git diff --cached --word-diff'
abbr gdct 'git diff --staged'

abbr gl 'git log'
abbr gls 'git log --stat'
abbr glp 'git log -p'

abbr gr 'git remote -v'
abbr gra 'git remote add'
abbr grset 'git remote set-url'

abbr grs 'git reset'
abbr grs! 'git reset --hard'
abbr grsh 'git reset HEAD'
abbr grsh! 'git reset HEAD --hard'
abbr gcleanall 'git reset --hard && git clean -dffx'

abbr gps 'git push'
abbr gpl 'git pull'

# chezmoi
abbr cm chezmoi