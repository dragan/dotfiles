"=====================================================
"===================== PLUGINS =======================
if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

"=====================================================
"===================== SETTINGS ======================

set nocompatible
filetype off
filetype plugin indent on

set laststatus=2
set encoding=utf-8              " Set default encoding to UTF-8
set autoread                    " Automatically reread changed files without asking me anything
set autoindent                  
set backspace=indent,eol,start  " Makes backspace key more powerful.
set incsearch                   " Shows the match while typing
set hlsearch                    " Highlight found searches
set mouse=a                     " Enable mouse mode

set noerrorbells                " No beeps
set number                      " Show line numbers
set showcmd                     " Show me what I'm typing
set noswapfile                  " Don't use swapfile
set nobackup                    " Don't create annoying backup files
set splitright                  " Split vertical windows right to the current windows
set splitbelow                  " Split horizontal windows below to the current windows
set autowrite                   " Automatically save before :next, :make etc.
set hidden
set fileformats=unix,dos,mac    " Prefer Unix over Windows over OS 9 formats
set noshowmatch                 " Do not show matching brackets by flickering
set noshowmode                  " We show the mode with airline or lightline
set ignorecase                  " Search case insensitive...
set smartcase                   " ... but not it begins with upper case 
set completeopt=menu,menuone
set nocursorcolumn              " speed up syntax highlighting
set nocursorline
set updatetime=300

set pumheight=10                " Completion window max size

" Make it obvious where 100 characters is
set textwidth=100
set colorcolumn=+1

"http://stackoverflow.com/questions/20186975/vim-mac-how-to-copy-to-clipboard-without-pbcopy
set clipboard^=unnamed
set clipboard^=unnamedplus

" ~/.viminfo needs to be writable and readable
set viminfo='200

set lazyredraw          " Wait to redraw

if has('persistent_undo')
  set undofile
  set undodir=~/.cache/vim
endif

" color
syntax enable
set t_Co=256

" .vimrc_background is created by base16-shell
if filereadable(expand("~/.vimrc_background"))
  set background=dark
  let base16colorspace=256
  source ~/.vimrc_background
endif

" open help vertically
command! -nargs=* -complete=help Help vertical belowright help <args>
autocmd FileType help wincmd L

" filetypes

autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4 

autocmd BufNewFile,BufRead *.ino setlocal noet ts=4 sw=4 sts=4
autocmd BufNewFile,BufRead *.txt setlocal noet ts=4 sw=4
autocmd BufNewFile,BufRead *.md setlocal noet ts=4 sw=4
autocmd BufNewFile,BufRead *.vim setlocal expandtab shiftwidth=2 tabstop=2
autocmd BufNewFile,BufRead *.hcl setlocal expandtab shiftwidth=2 tabstop=2

autocmd FileType json setlocal expandtab shiftwidth=2 tabstop=2
autocmd FileType ruby setlocal expandtab shiftwidth=2 tabstop=2

augroup filetypedetect
  autocmd BufNewFile,BufRead .tmux.conf*,tmux.conf* setf tmux
  autocmd BufNewFile,BufRead .nginx.conf*,nginx.conf* setf nginx
  autocmd BufNewFile,BufRead *.hcl setf conf
augroup END

"=====================================================
"===================== STATUSLINE ====================

let s:modes = {
      \ 'n': 'NORMAL', 
      \ 'i': 'INSERT', 
      \ 'R': 'REPLACE', 
      \ 'v': 'VISUAL', 
      \ 'V': 'V-LINE', 
      \ "\<C-v>": 'V-BLOCK',
      \ 'c': 'COMMAND',
      \ 's': 'SELECT', 
      \ 'S': 'S-LINE', 
      \ "\<C-s>": 'S-BLOCK', 
      \ 't': 'TERMINAL'
      \}

let s:prev_mode = ""
function! StatusLineMode()
  let cur_mode = get(s:modes, mode(), '')

  " do not update higlight if the mode is the same
  if cur_mode == s:prev_mode
    return cur_mode
  endif

  if cur_mode == "NORMAL"
    exe 'hi! StatusLine ctermfg=236'
    exe 'hi! myModeColor cterm=bold ctermbg=148 ctermfg=22'
  elseif cur_mode == "INSERT"
    exe 'hi! myModeColor cterm=bold ctermbg=23 ctermfg=231'
  elseif cur_mode == "VISUAL" || cur_mode == "V-LINE" || cur_mode == "V_BLOCK"
    exe 'hi! StatusLine ctermfg=236'
    exe 'hi! myModeColor cterm=bold ctermbg=208 ctermfg=88'
  endif

  let s:prev_mode = cur_mode
  return cur_mode
endfunction

function! StatusLineFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! StatusLinePercent()
  return (100 * line('.') / line('$')) . '%'
endfunction

function! StatusLineLeftInfo()
 let branch = fugitive#head()
 let filename = '' != expand('%:t') ? expand('%:t') : '[No Name]'
 if branch !=# ''
   return printf("%s | %s", branch, filename)
 endif
 return filename
endfunction

exe 'hi! myInfoColor ctermbg=240 ctermfg=252'

" start building our statusline
set statusline=

" mode with custom colors
set statusline+=%#myModeColor#
set statusline+=%{StatusLineMode()}               
set statusline+=%*

" left information bar (after mode)
set statusline+=%#myInfoColor#
set statusline+=\ %{StatusLineLeftInfo()}
set statusline+=\ %*

" go command status (requires vim-go)
set statusline+=%#goStatuslineColor#
set statusline+=%{go#statusline#Show()}
set statusline+=%*

" right section seperator
set statusline+=%=

" filetype, percentage, line number and column number
set statusline+=%#myInfoColor#
set statusline+=\ %{StatusLineFiletype()}\ %{StatusLinePercent()}\ %l:%v
set statusline+=\ %*

"=====================================================
"===================== MAPPINGS ======================

" This comes first, because we have mappings that depend on leader
" With a map leader it's possible to do extra key combinations
" i.e: <leader>w saves the current file
let mapleader="\<SPACE>"

" Some useful quickfix shortcuts for quickfix
map <C-n> :cn<CR>
map <C-m> :cp<CR>
nnoremap <leader>a :cclose<CR>

" put quickfix window always to the bottom
autocmd FileType qf wincmd J
augroup quickfix
    autocmd!
    autocmd FileType qf setlocal wrap
augroup END

" Fast saving
nnoremap <leader>w :w!<cr>
nnoremap <silent> <leader>q :q!<CR>

" Center the screen
nnoremap <space> zz

" Remove search highlight
nnoremap <leader><space> :nohlsearch<CR>

" Source the current Vim file
nnoremap <leader>pr :Runtime<CR>

" Close all but the current one
nnoremap <leader>o :only<CR>

" Better split switching
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Print full path
map <C-f> :echo expand("%:p")<cr>

" Visual linewise up and down by default (and use gj gk to go quicker)
noremap <Up> gk
noremap <Down> gj
noremap j gj
noremap k gk

" Exit on jk
imap jk <Esc>

" Source (reload configuration)
nnoremap <silent> <F5> :source $MYNVIMRC<CR>

nnoremap <F6> :setlocal spell! spell?<CR>

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

" Same when moving up and down
noremap <C-d> <C-d>zz
noremap <C-u> <C-u>zz

" Remap H and L (top, bottom of screen to left and right end of line)
nnoremap H ^
nnoremap L $
vnoremap H ^
vnoremap L g_

" Act like D and C
nnoremap Y y$

" Enter automatically into the files directory
autocmd BufEnter * silent! lcd %:p:h

" Do not show stupid q: window
map q: :q

" Don't move on * I'd use a function for this but Vim clobbers the last search
" when you're in a function so fuck it, practicality beats purity.
nnoremap <silent> * :let stay_star_view = winsaveview()<cr>*:call winrestview(stay_star_view)<cr>

" Time out on key codes but not mappings.
" Basically this makes terminal Vim work sanely.
if !has('gui_running')
  set notimeout
  set ttimeout
  set ttimeoutlen=10
  augroup FastEscape
    autocmd!
    au InsertEnter * set timeoutlen=0
    au InsertLeave * set timeoutlen=1000
  augroup END
endif

" Visual Mode */# from Scrooloose {{{
function! s:VSetSearch()
  let temp = @@
  norm! gvy
  let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
  let @@ = temp
endfunction

vnoremap * :<C-u>call <SID>VSetSearch()<CR>//<CR><c-o>
vnoremap # :<C-u>call <SID>VSetSearch()<CR>??<CR><c-o>

" create a go doc comment based on the word under the cursor
function! s:create_go_doc_comment()
  norm "zyiw
  execute ":put! z"
  execute ":norm I// \<Esc>$"
endfunction
nnoremap <leader>ui :<C-u>call <SID>create_go_doc_comment()<CR>

"
"===================== PLUGINS ======================
"

" ==================== Fugitive ====================
vnoremap <leader>gb :Gblame<CR>
nnoremap <leader>gb :Gblame<CR>

" ==================== vim-go ====================
let g:go_fmt_fail_silently = 0
let g:go_fmt_command = "goimports"
let g:go_list_type = "quickfix"
let g:go_auto_type_info = 0
let g:go_def_mode = "guru"
let g:go_echo_command_info = 1
let g:go_gocode_autobuild = 0
let g:go_gocode_unimported_packages = 1

let g:go_autodetect_gopath = 1
let g:go_info_mode = "guru"

" let g:go_metalinter_autosave = 1
" let g:go_metalinter_autosave_enabled = ['vet', 'golint']

let g:go_highlight_space_tab_error = 0
let g:go_highlight_array_whitespace_error = 0
let g:go_highlight_trailing_whitespace_error = 0
let g:go_highlight_extra_types = 0
let g:go_highlight_build_constraints = 1
let g:go_highlight_types = 0

let g:go_modifytags_transform = 'camelcase'

nmap <C-g> :GoDecls<cr>
imap <C-g> <esc>:<C-u>GoDecls<cr>

" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

augroup go
  autocmd!

  autocmd FileType go nmap <silent> <Leader>v <Plug>(go-def-vertical)
  autocmd FileType go nmap <silent> <Leader>s <Plug>(go-def-split)

  autocmd FileType go nmap <silent> <Leader>x <Plug>(go-doc-vertical)

  autocmd FileType go nmap <silent> <Leader>i <Plug>(go-info)
  autocmd FileType go nmap <silent> <Leader>l <Plug>(go-metalinter)

  autocmd FileType go nmap <silent> <leader>b :<C-u>call <SID>build_go_files()<CR>
  autocmd FileType go nmap <silent> <leader>t  <Plug>(go-test)
  autocmd FileType go nmap <silent> <leader>r  <Plug>(go-run)
  autocmd FileType go nmap <silent> <leader>e  <Plug>(go-install)

  autocmd FileType go nmap <silent> <Leader>c <Plug>(go-coverage-toggle)

  " I like these more!
  autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
  autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
  autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
  autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')
augroup END

" ==================== CtrlP ====================
let g:ctrlp_cmd = 'CtrlPMRU'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_switch_buffer = 'et'     " jump to a file if it's open already
let g:ctrlp_mruf_max=450             " number of recently opened files
let g:ctrlp_max_files=0              " do not limit the number of searchable files
let g:ctrlp_use_caching = 1
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'
let g:ctrlp_match_window = 'bottom,order:btt,max:10,results:10'
let g:ctrlp_buftag_types = {'go' : '--language-force=go --golang-types=ftv'}

nmap <C-b> :CtrlPCurWD<cr>
imap <C-b> <esc>:CtrlPCurWD<cr>

" ==================== delimitMate ====================
let g:delimitMate_expand_cr = 1   
let g:delimitMate_expand_space = 1    
let g:delimitMate_smart_quotes = 1    
let g:delimitMate_expand_inside_quotes = 0    
let g:delimitMate_smart_matchpairs = '^\%(\w\|\$\)'   

imap <expr> <CR> pumvisible() ? "\<c-y>" : "<Plug>delimitMateCR"

" ==================== NerdTree ====================
" For toggling
noremap <Leader>n :NERDTreeToggle<cr>
noremap <Leader>f :NERDTreeFind<cr>

let NERDTreeShowHidden=1

" ==================== Ag ====================
let g:ackprg = 'ag --vimgrep --smart-case'                                                   
" ==================== vim-json ====================
let g:vim_json_syntax_conceal = 0

" ==================== Various other plugin settings ====================
nmap  -  <Plug>(choosewin)

" Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

" vim: sw=2 sw=2 et
