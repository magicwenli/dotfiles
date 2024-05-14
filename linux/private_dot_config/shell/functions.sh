# vim: syntax=zsh

# DISPLAYS STATIC ON THE TERMINAL
static() {
  P=( " " █ ░ ▒ ▓ )
  while :; do
    printf "\e[$[RANDOM%LINES+1];$[RANDOM%COLUMNS+1]f${P[$RANDOM%5]}"
  done | lolcat
}

function pxy() {
	export http_proxy=http://127.0.0.1:7890
	export https_proxy=http://127.0.0.1:7890
	export no_proxy=127.0.0.1,localhost
	if [ -z "$1" ]; then
		echo -e "\033[32m[√] set proxy! <http_proxy: ${http_proxy}>\033[0m"
	fi
}

function unpxy(){
	unset http_proxy
	unset https_proxy
	unset no_proxy
	echo -e "\033[31m[×] unset proxy!\033[0m"
}

pxy no_echo