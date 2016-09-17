#
# .bashrc
################################################################################

# Prompt String
if [ "$(id -u)" != "0" ]; then
    PS1="[\A|\W]$ "
else
    PS1="[\A|\W]# "
fi

PATH=$PATH:$HOME/bin

# Aliases
alias vi=vim
alias vivim="vi ~/.vimrc"
alias vibash="vi ~/.bashrc"
alias ci=vim
alias ll="ls -l"
alias la="ls -a"
alias src="source ~/.bashrc; echo '.bashrc reloaded'"

