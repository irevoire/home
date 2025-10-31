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
