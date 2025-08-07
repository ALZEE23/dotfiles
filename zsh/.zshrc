  ###     ZSH SETTINGS      ###
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"
plugins=(
    zsh-autosuggestions
    zsh-completions
	fast-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh
setopt GLOB_DOTS
setopt NO_BG_NICE
setopt NO_HUP
setopt NO_BEEP

stty -ixon
stty erase "^?"

# Make nvim the default editor
export EDITOR='code'
export VISUAL='code'

# Change sudo prompt
export SUDO_PROMPT="$(printf "\033[1;31mPassword : \033[0;0m" )"

### DART ###
export PATH="$PATH:/usr/lib/dart/bin"

###Flutter###
export PATH="$PATH:$HOME/flutter/bin"

### Go ###
export PATH="$PATH:/usr/local/go/bin"

###   TERMINAL SETTINGS   ###

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export HISTCONTROL=ignoreboth:erasedups

if [ -d "$HOME/.local/bin" ] ;
  then PATH="$HOME/.local/bin:$PATH"
fi

# Replace ls with exa
alias ls='eza --icons'
alias la='eza -a --icons'
alias ll='eza -la --icons'

#readable output
alias df='df -h'

# set :q to exit terminal just like vim
alias :q='exit'

#free
alias free="free -mt"

#continue download
alias wget="wget -c"

#userlist
alias userlist="cut -d: -f1 /etc/passwd"

# make mount output command more readable
alias mount="mount | column -t"

#merge new settings
alias merge="xrdb merge ~/.Xresources && kill -USR1 $(pidof st)"

# Aliases for software managment
alias dnf='sudo dnf'

#ps
alias psa="ps auxf"
alias psgrep="ps aux | grep -v grep | grep -i -e VSZ -e"

#grub update
alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"

#add new fonts
alias update-fc='sudo fc-cache -fv'

#switch between bash and zsh
alias tobash="sudo chsh $USER -s /bin/bash && echo 'Now log out.'"
alias tozsh="sudo chsh $USER -s /bin/zsh && echo 'Now log out.'"

#hardware info --short
alias hw="hwinfo --short"

#skip yay integrity check
alias yayskip='yay -S --mflags --skipinteg'

#check vulnerabilities microcode
alias microcode='grep . /sys/devices/system/cpu/vulnerabilities/*'

#Cleanup orphaned packages
alias cleanup='sudo pacman -Rns $(pacman -Qtdq)'

#search content with ripgrep
alias rg="rg --sort path"

#get the error messages from journalctl
alias jctl="journalctl -p 3 -xb"

#systeminfo
alias probe="sudo -E hw-probe -all -upload"
alias sysfailed="systemctl list-units --failed"

#shutdown or reboot
alias ssn="sudo shutdown now"
alias sr="sudo reboot"

#give the list of all installed desktops - xsessions desktops
alias xd="ls /usr/share/xsessions"

# Spotify-TUI
spt() {
  pkill spotifyd
  spotifyd
  command spt
}

# Make manpage looks nicer
man () {
  LESS_TERMCAP_mb=$'\e[1;34m'   \
  LESS_TERMCAP_md=$'\e[1;34m'   \
  LESS_TERMCAP_me=$'\e[0m'      \
  LESS_TERMCAP_so=$'\e[01;35m'  \
  LESS_TERMCAP_se=$'\e[0m'      \
  LESS_TERMCAP_us=$'\e[1;32m'   \
  LESS_TERMCAP_ue=$'\e[0m'      \
  command man "$@"
}

# # ex = EXtractor for all kinds of archives
# # usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.asar)      asar extract $1 unpacked;;
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   tar xf $1    ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

#remove
alias rmgitcache="rm - ~/.cache/git"

# XAMPP
alias lampp="sudo /opt/lampp/xampp"
# bun completions
[ -s "/home/alzee23/.bun/_bun" ] && source "/home/alzee23/.bun/_bun"

# Laravel
#alias php="sudo php"
#alias delcon="sudo rm ./app/Http/Controllers/"
alias delmo="sudo rm ./app/Models/"
alias delpe="sudo rm ./resources/js/pages"

# Spicetify
alias spice="sudo chmod 777 /var/lib/flatpak/app/com.spotify.Client/x86_64/stable/active/files/extra/share/spotify/ -R "

# Kali
alias kali="distrobox-enter kali"
alias kali-root="cd /mnt/game/distrobox-storage/overlay/c289f949893b08bd0a3f381f00a1d43c73be5c147b58aed695bbe6ebcfe8c8f7/merged
"

# Android
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools


# Lmms
alias lmms="./home/alze23/lmms/build ./lmms"

#  Watchman
export PATH="$HOME/.cargo/bin:$PATH"

# ani-cli
# cp _ani-cli-zsh /path/to/your/completions
# echo "source /path/to/your/completions/_ani-cli-zsh" >> ~/.zshrc


# Nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# pnpm
export PNPM_HOME="/home/alzee23/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# alias php="ddev php"
# alias composer="ddev composer"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH=$PATH:/home/alzee23/.spicetify

# ulimit
ulimit -n 4096

eval "$(zoxide init zsh --cmd cd)"
# Install Ruby Gems to ~/gems
export GEM_HOME="$HOME/gems"
export PATH="$HOME/gems/bin:$PATH"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
export PATH="$HOME/.local/bin:$PATH"

# obsidian 
alias obsidian="flatpak run md.obsidian.Obsidian"

# baobab
alias baobab="flatpak run org.gnome.baobab"

# flutter
export PATH="$HOME/flutter/bin:$PATH"
export PATH=$PATH:$HOME/Android/Sdk/cmdline-tools/latest/bin
