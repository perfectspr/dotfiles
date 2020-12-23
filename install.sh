!/usr/bin/sh

sudo apt-get update && sudo apt-get install -y --no-install-recommends \
    sudo \
    software-properties-common \
    apt-transport-https \
    ca-certificates \
    build-essential \
    apt-utils \
    libssl-dev \
    libbz2-dev \
    libreadline-dev \
    libsqlite3-dev \
    libncurses5-dev \
    libxml2-dev \
    libxmlsec1-dev \
    libffi-dev \
    liblzma-dev \
    llvm \
    locales \
    zlib1g-dev \
    xz-utils \
    tk-dev \
    git \
    zsh \
    tmux \
    ripgrep \
    autojump \
    httpie \
    zip \
    gpg-agent \
    fd-find \
    wget \
    curl \
    ssh \
    unzip \
    bzip2 \
    && sudo apt-get autoremove -y \
    && sudo apt-get clean -y \
    && sudo rm -rf /var/lib/apt/lists/*

echo "install pyenv"
export PYENV_ROOT=$HOME/.pyenv
export PATH=$HOME/.local/bin:$PYENV_ROOT/shims:$PYENV_ROOT/bin:$PATH
curl https://pyenv.run | bash  \
    && pyenv install 3.7.9 \
    && pyenv global 3.7.9

echo "install nvm"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash

echo "install oh-my-zsh"
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true 

echo "install vim"
sudo add-apt-repository ppa:jonathonf/vim \
    && sudo apt-get install -y vim

echo "install fzf"
git clone --depth 1 https://github.com/junegunn/fzf.git .fzf \
    && .fzf/install --bin

echo "install vim-plug"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

#brew tap homebrew/cask-fonts
# Install other packages
#brew install node nvm yarn pyenv autojump tmux reattach-to-user-namespace fzf ripgrep fd zsh aira2  translate-shell vim ripgrep httpie 
#brew cask install postman docker amethyst font-hack-nerd-font

rm $HOME/.zshrc
ln -s $PWD/.tmux.conf $HOME/.tmux.conf
ln -s $PWD/.vimrc" $HOME/.vimrc
ln -s $PWD/.zshrc" $HOME/.zshrc
ln -s $PWD/coc-settings.json" $HOME/.vim/coc-settings.json
