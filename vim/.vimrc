set nocompatible
filetype off

" Download vim-plug if not present
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" Plugins
Plug 'tpope/vim-sensible' "sensible defaults

Plug 'lucasprag/simpleblack' "colorscheme
Plug 'ryanoasis/vim-devicons' "file icons in vim
Plug 'vim-airline/vim-airline' "status line at bottom
Plug 'vim-airline/vim-airline-themes' "airline themes
Plug 'lilydjwg/colorizer' "always color text

Plug 'scrooloose/nerdtree' "file browser
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'  } "file search
Plug 'junegunn/fzf.vim'

Plug 'othree/html5.vim' "html5 syntax highlight 
Plug 'JulesWang/css.vim' "css syntax highlight 
Plug 'othree/yajs.vim' "js syntax highlight
Plug 'elzr/vim-json' "json syntax highlight
Plug 'Valloric/MatchTagAlways' "match tags in html/xml
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'styled-components/vim-styled-components', { 'branch': 'main'  }

Plug 'editorconfig/editorconfig-vim' "editorconfig for vim 
Plug 'tomtom/tcomment_vim' "easily comment out code
Plug 'tpope/vim-surround' "surround everything, genius

Plug 'neoclide/coc.nvim', {'branch': 'release'} "vim intellisense

Plug 'airblade/vim-gitgutter' "git diff

" Initialize plugin system
call plug#end()

" Vim options
set number "show line numbers 
set numberwidth=1 "show line numbers 
set autoindent
set tabstop=4 "4 spaces as soft tab
set shiftwidth=4 "number of spaces to use for autoindent
set shiftround "round indent to multiples of shiftwidth
set expandtab "insert tab with the right amount of spacing
set textwidth=120
set formatoptions=qrn1
set ttyfast "make scrolling faster
set lazyredraw "even faster scrolling 
set mouse=a "resize, select and copy with the mouse
set showcmd "show incomplete commands 
set laststatus=1 "always display the status line
set ignorecase "ignore case when searching
set smartcase "but use case sensitive if a capital letter is present
set noshowmode "no need to show mode, airline takes care of that
set scrolloff=3 "display some extra lines at the bottom
set visualbell "visual bell for errors
set ruler
set backspace=indent,eol,start
set autoread
set encoding=utf-8
set nowrap "hate wrapping
set clipboard=unnamed "use system clipboard

" Enable syntax highlight
syntax enable 

" Natural splitting
set splitbelow 
set splitright

" Easy buffer switch
nnoremap <Leader>b :ls<CR>:b<Space>

" Plugin config
" Themes
colorscheme simpleblack
let g:airline_theme='minimalist'
let g:airline_powerline_fonts=1 "fix airline powerline font
let g:airline#extensions#tabline#enabled=1

" NERDTree
let NERDTreeQuitOnOpen=0 "leave NERDTree open after opening file
let NERDTreeShowHidden=1 "always show dot files
let NERDTreeMinimalUI=1
map  <Leader>n  :NERDTreeFind<CR> "\ + n to open NERDTreeFind

" Coc extensions
" \ 'coc-sh', " currently not working correctly with node 12
let g:coc_global_extensions = [
            \ 'coc-emmet',
            \ 'coc-eslint',
            \ 'coc-prettier',
            \ 'coc-pairs',
            \ 'coc-css',
            \ 'coc-html',
            \ 'coc-json',
            \ 'coc-tsserver',
            \ 'coc-sh',
            \ 'coc-syntax',
            \ 'coc-yaml',
            \ 'coc-emoji',
            \ 'coc-import-cost',
            \ 'coc-webpack'
            \ ]

" Enable prettier command
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" Highlight keywords in comments like TODO, FIXME, WARNING, NOTE
autocmd VimEnter * :silent! call matchadd('Todo','TODO\|FIXME\|WARNING\|NOTE\|Plugin:', -1)

" Swap file and undo/backup files
set backupdir=~/.vim/tmp
set directory=~/.vim/tmp
