!/usr/bin/sh

# Install homebrew

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
git -C "$(brew --repo)" remote set-url origin https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git
git -C "$(brew --repo homebrew/core)" remote set-url origin https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-core.git
git -C "$(brew --repo homebrew/cask)" remote set-url origin https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-cask.git
export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles
brew update
brew tap homebrew/cask-fonts
# Install other packages
brew install node nvm yarn pyenv autojump tmux reattach-to-user-namespace fzf ripgrep fd zsh aira2  translate-shell vim ripgrep httpie 
brew cask install postman iterm2 docker amethyst font-hack-nerd-font

# Install  oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# install vim-plug 
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Link Config files
if [ ! -d $HOME/.pip  ];then
	mkdir $HOME/.pip
  else
	  echo dir exist
fi

# install JDK
brew cask install java11

# install language server
ln -s $PWD/pip/pip.conf" $HOME/.pip/pip.conf
ln -s $PWD/.nmprc $HOME/.npmrc
ln -s $PWD/.tmux.conf $HOME/.tmux.conf
ln -s $PWD/vimrc" $HOME/.vimrc
ln -s $PWD/coc-settings.json" $HOME/.vim/coc-settings.json
ln -s $PWD/.translate-shell" $HOME/.translate-shell

# coc plugins
# coc-explorer coc-eslint coc-python coc-git  coc-html coc-vetur coc-yaml coc-xml coc-json coc-tabnine coc-snippets  coc-tsserver coc-css
ehco Done

