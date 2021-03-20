# it should do nothing if it was already installed
sudo xcode-select --install

# install brew if it’s not already installed
if ! command -v brew &> /dev/null
then
    echo "installing brew"
    export HOMEBREW_PREFIX=/opt/homebrew
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

if ! command -v git &> /dev/null
then
    echo "installing git"
    brew install git
fi

if ! command -v vim &> /dev/null
then
    echo "installing vim"
    brew install vim
fi

# currently we need to compile neovim by hand to have access to the last nightly features
if ! command -v nvim &> /dev/null
then
    echo "installing neovim"
    brew install gperf
    brew install luajit
    brew install luarocks
    brew install libuv1
    brew install cmake
    brew install autoconf
    brew install automake
    git clone https://github.com/neovim/neovim.git
    cd neovim
    make CMAKE_BUILD_TYPE=Release
    sudo make install
fi

if ! command -v fzf &> /dev/null
then
    echo "installing fzf"
    brew install fzf
fi

if ! command -v rg &> /dev/null
then
    echo "installing ripgrep"
    brew install ripgrep
fi

if ! command -v zsh &> /dev/null
then
    echo "installing zsh"
    brew install zsh
    echo "use zsh by default for the current user"
    chsh -u $USER -s $(whereis zsh)
fi

if ! command -v rustup &> /dev/null
then
    echo "installing the rust env"
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fi

if ! command -v rust-analyzer &> /dev/null
then
    echo "installing rust-analyzer"
    rustup component add rust-src
    git clone https://github.com/rust-analyzer/rust-analyzer.git && cd rust-analyzer
    cargo xtask install --server
fi

# execute the setup of the main branch
curl --proto '=https' --tlsv1.2 -sSf https://raw.githubusercontent.com/irevoire/home/master/.vimrc | sh
