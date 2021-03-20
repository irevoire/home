cd $HOME
git init
git remote add origin https://github.com/irevoire/home.git
git pull

# setup vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim -c PlugInstall -c q -c q

# setup neovim
git clone https://github.com/wbthomason/packer.nvim\
	~/.local/share/nvim/site/pack/packer/start/packer.nvim
nvim --headless +PackerInstall +q
nvim --headless +PackerCompile +q
