" :e $MYVIMRC to edit this file "
set nocompatible	"iMproved"

" setup for vundle
" git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" :PluginInstall after adding plugins
filetype off	"vundle required
" Better command-line completion
set wildmenu
" Show partial commands in the last line of the screen (right side)
set showcmd
" Highlight searches. (use :nohl to turn this off)
set hlsearch
" Incremental search
set incsearch

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'


" light statusline plugin"
Plugin 'itchyny/lightline.vim'
set noshowmode
let g:lightline = {
    \ 'colorscheme': 'darcula',
    \ }

" soft caps lock support
Plugin 'tpope/vim-capslock'

" git support
Plugin 'tpope/vim-fugitive'

" surround text object
Plugin 'tpope/vim-surround'

" non blocking make
Plugin 'tpope/vim-dispatch'

" (un)commenting
" gc(c) to (un)comment. Supports motion as well
Plugin 'tpope/vim-commentary'
autocmd FileType c,cpp,cs,java setlocal commentstring=//\ %s

" function argument text objects
Plugin 'vim-scripts/argtextobj.vim'

" Fuzzy file matching
Plugin 'ctrlpvim/ctrlp.vim'
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:ctrlp_extensions=['tag']

" popular colorscheme
"Plugin 'altercation/vim-colors-solarized'

Plugin 'dracula/vim'

" * search visual selection instead of word"
Plugin 'nelstrom/vim-visual-star-search'

" highlight cursor after search jump
Plugin 'inside/vim-search-pulse'
set cursorline
let g:vim_search_pulse_mode = 'pattern'

" align text easily
Plugin 'godlygeek/tabular'

" Plugin not supported on older vim.
" " buffer explorer
" Plugin 'jlanzarotta/bufexplorer'

Plugin 'Shougo/unite.vim'
Plugin 'Shougo/neomru.vim'
Plugin 'Shougo/vimproc.vim'
Plugin 'Shougo/neoyank.vim'
Plugin 'Shougo/unite-outline'
Plugin 'Shougo/vimfiler.vim'
let g:vimfiler_as_default_explorer = 1

" All of your Plugins must be added before the following line
call vundle#end()			"required
filetype plugin indent on	"required

let g:unite_source_rec_max_cache_files = 30000
let g:unite_redraw_hold_candidates = 30000
call unite#filters#matcher_default#use(['matcher_fuzzy'])

let g:unite_source_menu_menus = {}
let g:unite_source_menu_menus.unite = {
	\	'description' : 'Unite menu',
	\}
let g:unite_source_menu_menus.unite.command_candidates = [
	\['File Outline',				'Unite outline'],
	\['Search in buffer',			'Unite line -start-insert'],
	\['Yank History',				'Unite history/yank -no-empty'],
	\['Open Buffers',				'Unite buffer'],
	\['MRU - Most Recently Used',	'Unite file_mru'],
	\['Files in Git',				'Unite -start-insert -buffer-name=git-files -resume file_rec/git:--cached:--others:--exclude-standard'],
	\['Bookmarks',					'Unite bookmark -no-empty'],
	\['Add Bookmark',				'UniteBookmarkAdd'],
	\['Vundle menu',				'Unite menu:Vundle -auto-resize'],
	\['Edit .vimrc',				'e $MYVIMRC'],
	\['Edit .bashrc',				'e ~/.bashrc'],
	\['Edit .gitconfig',				'e ~/.gitconfig'],
	\]
nnoremap <leader>u :Unite -silent -auto-resize menu:unite<CR>

let g:unite_source_menu_menus.Vundle = {
	\	'description' : 'Vundle menu',
	\}
let g:unite_source_menu_menus.Vundle.command_candidates = [
	\['Install Plugins      :PluginInstall',	'PluginInstall'],
	\['Update Plugins       :PluginUpdate',		'PluginUpdate'],
	\['Uninstall Plugins    :PluginClean',		'PluginClean'],
	\]


" syntax highlighting per filetype
syntax on

" colorscheme configuration
" download rainbow.zip from
" http://www.vim.org/scripts/script.php?script_id=463
" set background=dark
" colorscheme neon
color dracula

" always display status lines
set laststatus=2

" tabstop, softtabstop, shiftwidth all at 4
set ts=4 sts=4 sw=4

" visible whitespace
" also possible, eol:¬
set listchars=tab:»\ ,trail:·,nbsp:~
set list

" highlight long lines
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v',100)

" enable hybrid line numbering
set number relativenumber

"folding support
set foldmethod=syntax
set foldlevelstart=99
" -----------------------outdated setings-----------------------
"
" Fuzzy function definition search
" Plugin 'tacahiroy/ctrlp-funky'
" let g:ctrlp_extensions=['bufertag', 'line', 'funky']

" file outline pane
" dependency on ctags.. install utility first
" Plugin 'majutsushi/tagbar'
" nmap <F10> :TagbarToggle<CR>

