# my try at implementing a molokai theme for kakoune
# Currently it’s shit

evaluate-commands %sh{
    black="rgb:272822"
    gray="rgb:75715e"
    silver="rgb:f8f8f2"
    white="rgb:f9f8f5"

    pink="rgb:FFB6C1"
    purple="rgb:ae81ff"
    blue="rgb:66d9ef"
    cyan="rgb:a1efe4"
    green="rgb:a6e22e"
    yellow="rgb:f4bf75"
    orange="rgb:FFA500"
    red="rgb:f92672"

    echo "
        face global value $cyan
        face global type $purple
        face global variable $white
        face global function $green
        face global module $green
        face global string $pink
        face global error $red
        face global keyword $red
        face global operator $orange
        face global attribute $pink
        face global comment $blue+i
        face global meta $red
        face global builtin $white+b

        face global title $red
        face global header $orange
        face global bold $pink
        face global italic $purple
        face global mono $green
        face global block $cyan
        face global link $green
        face global bullet $green
        face global list $white

        face global Default $white,$black

        face global PrimarySelection $black,$pink
        face global PrimaryCursor $black,$cyan
        face global PrimaryCursorEol $black,$cyan

        face global SecondarySelection $black,$purple
        face global SecondaryCursor $black,$orange
        face global SecondaryCursorEol $black,$orange

        face global MatchingChar $black,$blue
        face global Search $blue,$green
        face global CurrentWord $white,$blue

        # listchars
        face global Whitespace $gray,$black+f
        # ~ lines at EOB
        face global BufferPadding $silver,$black
        face global LineNumbers $silver,$black
        # must use -hl-cursor
        face global LineNumberCursor $white,$gray+b
        face global LineNumbersWrapped $silver,$black+i
        # when item focused in menu
        face global MenuForeground $gray,$silver+b
        # default bottom menu and autocomplete
        face global MenuBackground $white,$gray
        # complement in autocomplete like path
        face global MenuInfo $gray,$orange
        # clippy
        face global Information $orange,$black
        face global Error $black,$red
        # all status line: what we type, but also client@[session]
        face global StatusLine $green,$black
        # insert mode, prompt mode
        face global StatusLineMode $black,$green
        # message like '1 sel'
        face global StatusLineInfo $red,$black
        # count
        face global StatusLineValue $orange,$black
        face global StatusCursor $white,$blue
        # like the word 'select:' when pressing 's'
        face global Prompt $black,$green
    "
}
