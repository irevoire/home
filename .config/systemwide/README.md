## Making ergo-l work in tty

Copy the fr-ergol.map file to /usr/local/share/kbd/keymaps/fr-ergol.map:
```bash
sudo mkdir -p /usr/local/share/kbd/keymaps/
sudo cp path/to/fr-ergol.map /usr/local/share/kbd/keymaps/fr-ergol.map
# The we must load the keys with their full path
loadkeys /usr/local/share/kbd/keymaps/fr-ergol.map
```

Load the config automatically by adding the following line to `/etc/vconsole.conf`
```
KEYMAP=/usr/local/share/kbd/keymaps/fr-ergol.map
```

## Making ergo-l work on X

You can always load the keymap by running:
```
setxkbmap fr -variant ergol
```

To make this permanent I added the following lines to `/etc/X11/xorg.conf.d/00-keyboard.conf`

```
Section "InputClass"
        Identifier "system-keyboard"
        MatchIsKeyboard "on"
        Option "XkbLayout" "fr"
        Option "XkbModel" "pc104"
        Option "XkbVariant" "ergol"
EndSection
```
