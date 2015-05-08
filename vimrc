set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'derekwyatt/vim-scala'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-fugitive'
Plugin 'tomtom/tcomment_vim'
Plugin 'kien/ctrlp.vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'mattn/gist-vim'
Plugin 'mattn/webapi-vim'
Plugin 'thoughtbot/vim-rspec'
Plugin 'rking/ag.vim'

call vundle#end()
filetype plugin indent on

" General
set nocompatible
set noswapfile
set nobackup
set encoding=utf-8
set listchars=tab:▸\ ,eol:¬
set anti
set hlsearch
set incsearch
set nowrap
set number
set list
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set splitbelow
set splitright
set wildignore+=*/vendor/**
set wildignore+=*/bin/**
set wildignore+=*~,*/log/*.log,*/tmp/*,*/coverage/*.html,*/.sass-cache/*,public/system/*,public/uploads/*,*/_site/*,*.jpg,*.jpeg,*.gif,*.png,*.pdf,*.mp3

" Solarized
syntax enable
set background=dark
colorscheme solarized

" Source the vimrc file after writing buffer
if has("autocmd")
  autocmd! bufwritepost .vimrc source $MYVIMRC
endif

" Key mappings
let mapleader = ","
nmap <C-h> <C-W>h
nmap <C-j> <C-W>j
nmap <C-k> <C-W>k
nmap <C-l> <C-W>l
nmap - :Explore<CR>
map ,, <C-^>

" Trim trailing whitespace
function! <SID>StripTrailingWhitespaces()
    let _s=@/
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    let @/=_s
    call cursor(l, c)
endfunction
autocmd BufWritePre *.rb,*.js,*.m,*.h,*.scala :call <SID>StripTrailingWhitespaces()

" Gist
let g:gist_clip_command = 'pbcopy'
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1
let g:gist_post_private = 1

" Rspec
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>
let g:rspec_runner = "os_x_iterm"
let g:rspec_command = "!zeus rspec {spec}"

" Ag
map <C-f> :Ag 
map <Leader>f :Ag <cword><CR>
