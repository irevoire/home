######### DIRECTIONS REMAP HJKL[CTSR] TO JKLM[TSRN]

# map move down to s
map global normal s j -docstring "move down"
map global goto   s j -docstring "buffer bottom"
map global view   s j -docstring "scroll down"
map global normal S J -docstring "extend down"
map global normal j s -docstring "select to next character"
map global goto   j s -docstring "window top"
map global view   j s -docstring "cursor on top"
map global normal J S -docstring "extend to next character"

# map move up to r
map global normal r k -docstring "move up"
map global goto   r k -docstring "buffer top"
map global view   r k -docstring "scroll up"
map global normal R K -docstring "extend up"
map global normal k r -docstring "select regex matches in selected text"
map global normal K R -docstring "split selected text on regex matches"

# map move right to n
map global normal n l         -docstring "move right"
map global normal <a-r> <a-l> -docstring "select to line end"
map global goto   n l         -docstring "line end"
map global view   n l         -docstring "scroll right"
map global normal N L         -docstring "extend right"
map global normal <a-N> <a-L> -docstring "extend to line end"

# map move left to t
map global normal t h         -docstring "move left"
map global normal <a-t> <a-h> -docstring "select to line begin"
map global goto   t h         -docstring "line begin"
map global view   t h         -docstring "scroll left"
map global normal T H         -docstring "extend left"
map global normal <a-T> <a-H> -docstring "extend to line begin"
map global normal h t         -docstring "cut selected text"
map global normal <a-h> <a-t> -docstring "cut selected text without yanking"
map global goto   h t         -docstring "window center"
map global normal H T         -docstring "expand a new cursor below"

# use é to go one word forward
map global normal é w -docstring "select to next word start"
map global normal É W -docstring "extend to next word start"
# allow the usage of "«" and "»" to indent and deindent
map global normal « < -docstring "deindent"
map global normal » > -docstring "indent"

