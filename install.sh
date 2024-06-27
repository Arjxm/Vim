#!/bin/bash

# Install Vim-Plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install Vim plugins
vim +PlugInstall +qall

# Install the Rust plugin for Coc.nvim
coc-install-extension coc-rust-analyzer

echo "Vim configuration and plugins installed successfully!"
