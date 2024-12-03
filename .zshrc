[ -f ~/.zshrc_grml ] && source ~/.zshrc_grml

autoload -U colors && colors

# Switching shell safely and efficiently? http://www.zsh.org/mla/workers/2001/msg02410.html
bash() {
    NO_SWITCH="yes" command bash "$@"
}
restart () {
    exec $SHELL $SHELL_ARGS "$@"
}

# List all occurrences of programm in current PATH
plap() {
	emulate -L zsh
	if [[ $# = 0 ]] ; then
		echo "Usage:    $0 program"
		echo "Example:  $0 zsh"
		echo "Lists all occurrences of program in the current PATH."
	else
		ls -l ${^path}/*$1*(*N)
	fi
}

# Find out which libs define a symbol
lcheck() {
	if [[ -n "$1" ]] ; then
		nm -go /usr/lib/lib*.a 2>/dev/null | grep ":[[:xdigit:]]\{8\} . .*$1"
	else
		echo "Usage: lcheck <function>" >&2
	fi
}

# print hex value of a number
hex() {
	emulate -L zsh
	if [[ -n "$1" ]]; then
		printf "%x\n" $1
	else
		print 'Usage: hex <number-to-convert>'
		return 1
	fi
}

# remove the (git) thing and add an indication of the status
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr "%F{red}"
zstyle ':vcs_info:*' stagedstr "%F{yellow}" # what is this
zstyle ':vcs_info:git*' formats "%F{magenta}[%F{green}%m%u%c%b%F{magenta}]%f"

function emoji_prompt () {
	CUTE_EMOJI=( "🎃" "🎄" "😁" "😊" "😎" "😚" "😏" "😇" "🤠" "🥳" "🤓" "💩"
		"👏" "🤜" "🤟" "🤘" "👌" "🖕" "🧠" "👀" "🏆" "🥁" "🎷" "🎺" "🎸"
		"🎻" "🎲" "🚲" "🚀" "🛸" "💰" "🎊" "🎉" "🧨" "💣" "🔪" "🧻" "🧼"
		"💡" "🧲" "🧪" "🔎" "🧸" "💗" "💖" "💝" "🧡" "💛" "💚" "💙" "💜"
		"🔆" "✅" "🔱" "📛" "♻️"  "🎵" "🎶" "💬" "💭" "🍏" "🍎" "🍐" "🍊"
		"🍋" "🍌" "🍉" "🍇" "🍓" "🍈" "🍒" "🍑" "🍍" "🥭" "🥥" "🥝" "🍅"
		"🍆" "🥑" "🥦" "🥒" "🥬" "🌶" "🌽" "🥕" "🥔" "🍠" "🥐" "🍞" "🥖"
		"🥨" "🥯" "🧀" "🥚" "🍳" "🥞" "🥓" "🥩" "🍗" "🍖" "🌭" "🍔" "🍟"
		"🍕" "🥪" "🥙" "🌮" "🌯" "🥗" "🥘" "🥫" "🍝" "🍜" "🍲" "🍛" "🍣"
		"🍱" "🥟" "🍤" "🍙" "🍚" "🍘" "🍥" "🥮" "🥠" "🍢" "🍡" "🍧" "🍨"
		"🍦" "🥧" "🍰" "🎂" "🍮" "🍭" "🍬" "🍫" "🍿" "🧂" "🍩" "🍪" "🌰"
		"🥜" "☕️" "🍵" "🥤" "🍶" "🍺" "🥃" "🥄" "🍴" "🥣" "🥢" "🐶" "🐱"
		"🐭" "🐹" "🐰" "🦊" "🦝" "🐻" "🐼" "🦘" "🦡" "🐨" "🐯" "🦁" "🐮"
		"🐷" "🐽" "🐸" "🐵" "🙈" "🙉" "🙊" "🐒" "🐔" "🐧" "🐦" "🐤" "🐣"
		"🐥" "🦆" "🦢" "🦅" "🦉" "🦚" "🦜" "🦇" "🐺" "🐗" "🐴" "🦄" "🐝"
		"🐛" "🦋" "🐌" "🐚" "🐞" "🐜" "🦗" "🕷" "🕸" "🦂" "🦟" "🐢" "🐍"
		"🦎" "🦖" "🦕" "🐙" "🦑" "🦐" "🦀" "🐡" "🐠" "🐟" "🐬" "🐳" "🐋"
		"🦈" "🐊" "🐅" "🐆" "🦓" "🦍" "🐘" "🦏" "🦛" "🐪" "🐫" "🦙" "🦒"
		"🐃" "🐂" "🐄" "🐎" "🐖" "🐏" "🐑" "🐐" "🦌" "🐕" "🐩" "🐈" "🐓"
		"🦃" "🕊" "🐇" "🐁" "🐀" "🐿" "🦔" "🐾" "🐉" "🐲" "🌵" "🎄" "🌲"
		"🌳" "🌴" "🌱" "🌿" "☘️"  "🍀" "🎍" "🎋" "🍃" "🍂" "🍁" "🍄" "🌾"
		"💐" "🌷" "🌹" "🥀" "🌺" "🌸" "🌼" "🌻" "🌞" "🌝" "🌛" "🌜" "🌚"
		"🌕" "🌖" "🌗" "🌘" "🌑" "🌒" "🌓" "🌔" "🌙" "🌎" "🌍" "🌏" "💫"
		"⭐️" "🌟" "✨" "⚡️" "☄️" "💥"  "🔥" "🌈" "☀️"  "⛅️" "☁️"  "❄️"  "☃️"
		"⛄️" "💨" "💧" "💦" "🌊"
		)
	DEFAULT_EMOJI=${CUTE_EMOJI[$RANDOM % ${#CUTE_EMOJI[@]} + 1 ]}
	BIRTHDAY="2111"
	TODAY=$(date +%m%d)
	EMOJI="1"
	if [[ $TODAY = $BIRTHDAY ]]; then EMOJI="🎂"; # Birthday!
	elif [[ $TODAY = 1231 ]]; then EMOJI="🍾"; # New Years Eve
	elif [[ $TODAY = 0101 ]]; then EMOJI="🎊"; # New Years Day
	elif [[ $TODAY = 0214 ]]; then EMOJI="💘"; # Valentines Day
	elif [[ $TODAY = 1031 ]]; then EMOJI="🎃"; # Halloween
	elif [[ $TODAY = 1231 ]]; then EMOJI="🎄"; # Christmas
	else EMOJI=$DEFAULT_EMOJI
	fi
	REPLY=$EMOJI
}

grml_theme_add_token emoji -f emoji_prompt '' ' '

# username is yellow
zstyle ':prompt:grml:left:items:user' pre '%F{yellow}'
zstyle ':prompt:grml:left:setup' items rc change-root user at \
                                       host path emoji percent
zstyle ':prompt:grml:right:setup' items vcs sad-smiley

fpath+=~/.zfunc
compinit

unsetopt nomatch

export PATH="${PATH}:${HOME}/.local/bin/"
[ -f $HOME/.cargo/env ] && source $HOME/.cargo/env
export FZF_DEFAULT_COMMAND='rg --files'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f /usr/share/nvm/init-nvm.sh ] && source /usr/share/nvm/init-nvm.sh
[ -f "${HOME}/.iterm2_shell_integration.zsh" ] && source "${HOME}/.iterm2_shell_integration.zsh"


ulimit -n 10240

alias carog="cargo"
alias acrog="cargo"
alias acrgo="cargo"

function icat () {
	if [ "$TERM_PROGRAM" == "iTerm.app" ]
	then
		imgcat "$@"
	elif [ "$TERMINFO" =~ .*"kitty".* ]
	then
		kitty icat --align=left "$@"
	elif command -v viu &> /dev/null
	then
		if [ -z "$@" ] # if there is no arguments
		then
			viu --transparent - # read from stdin
		else
			viu --transparent "$@"
		fi
	else
		echo "No image viewer were found. Install viu"
	fi
	
}

alias isvg="rsvg-convert | icat" 
alias idot="dot -T png -Gbgcolor="none" -Ncolor="lightgray" -Nfontcolor="lightgray" -Ecolor="lightgray" | icat" 

export PATH="$PATH:$(yarn global bin)"
export PATH="$PATH:$(gem environment gempath)"
export PATH="$PATH:/home/irevoire/.local/share/gem/ruby/3.0.0/bin"
export MILLI_BENCH_DATASETS_PATH=~/datasets
export MEILI_TEST_FULL_SNAPS=true
export LINDERA_CACHE=$HOME/.cache/lindera

export TERM=xterm-256color
export EDITOR=hx

export RUST_BACKTRACE=1
# export RUSTFLAGS="-Z macro-backtrace"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
