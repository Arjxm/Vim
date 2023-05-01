# Vim Configuration Readme
This repository contains my Vim configuration files including plugins, key mappings, and user interface settings. The following sections describe the plugins used, configuration options, and key mappings.

## Plugins
The following plugins are used in this configuration:

- junegunn/vim-easy-align: A plugin that allows easy alignment of text.
- honza/vim-snippets: A collection of snippets for various programming languages.
- preservim/nerdtree: A tree explorer plugin.
- tpope/vim-fireplace: A Clojure REPL plugin.
- rdnetto/YCM-Generator: A plugin that generates .ycm_extra_conf.py files for the YouCompleteMe plugin.
- nsf/gocode: A plugin that provides autocompletion for Go programming language.
- junegunn/fzf: A fuzzy file finder plugin.
- ~/my-prototype-plugin: A custom plugin.
- neoclide/coc.nvim: A language server protocol plugin.
- rhysd/vim-clang-format: A plugin that allows running clang-format from Vim.
- jiangmiao/auto-pairs: A plugin that automatically adds closing brackets, quotes, and other characters.
- prettier/vim-prettier: A plugin that allows formatting code with Prettier.

## Configuration Options

Formatting
g:prettier#autoformat: Enables automatic formatting with Prettier on save.
autocmd BufWritePre,FileWritePre *.{js,jsx,ts,tsx,css,scss,less,json,graphql,md} call prettier#autoformat(): Runs Prettier on save for supported file types.
nmap <A-f> :ClangFormat <CR>: Runs clang-format on the current file when <A-f> is pressed.
let g:clang_format#style = 'Google': Sets the Google style for clang-format.
Auto Save
let g:auto_save = 1: Enables auto-save on Vim startup.
let g:auto_save_events = ["InsertLeave", "TextChanged"]: Sets events that trigger auto-save.

## Custom Colorscheme 
![image](https://user-images.githubusercontent.com/81867699/235435357-3a2e16bc-e6b8-4bbc-81a7-3d486ca76ab7.png)
![image](https://user-images.githubusercontent.com/81867699/235435376-52327334-4884-4f99-b051-dba9f4d5cd78.png)

## Installtion 
Clone the repository to your local machine by running the following command in your terminal:

``` 
https://github.com/Iam-Arjun23/Vim-Config.git

```
Navigate to the cloned repository by running:

```
cd Vim-Config
```

Copy the vimrc file to your home directory by running:

```
cp vimrc ~/.vimrc
```
This will copy the Vim configuration file to your home directory and rename it to .vimrc.

Install the Vim plugin manager, Plug, by running:

```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

This will download and install the Plug plugin manager.

Launch Vim and run the :PlugInstall command to install the plugins specified in the vimrc file.

```
:PlugInstall
```
This will download and install all the plugins listed in the vimrc file.

That's it! You can now start using your new Vim configuration. Try opening a file in Vim and see if everything works as expected.

If you encounter any issues, feel free to open an issue on the repository and we'll do our best to help you out.


