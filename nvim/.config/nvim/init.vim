" General Settings: {{{

set termguicolors
set background=dark
set nocompatible                " make vim more powerful
filetype plugin indent on
filetype plugin on
syntax on
set mouse=a                     " support mouse
set confirm                     " ask before unsage action

" ssh 사용시 발생할 수 있는 문제 예방
set noswapfile nobackup         " don't use swap file

" Let's save undo info!
" 이전 .vim 폴더에서 ~/.config/nvim 폴더로 이동 함
if !isdirectory($HOME."/.config/nvim")
    call mkdir($HOME."/.config/nvim", "", 0770)
endif
if !isdirectory($HOME."/.config/nvim/undo-dir")
    call mkdir($HOME."/.config/nvim/undo-dir", "", 0700)
endif
" set undodir=~/.vim/undo-dir
set undofile

set encoding=utf-8
set clipboard=unnamed,unnamedplus               " 외부 clipboard 이용
" set updatetime=100
set number relativenumber                     " with relativenumber, show current number

set showcmd
set noshowmode
set wildmenu
set wildmode=longest,list,full

" tab settings: remove autoindent, shiftround
set smarttab tabstop=4                                 " width of a tab character
set expandtab softtabstop=4 shiftwidth=4               " cause spaces to be used instead of tabs
set smartindent

set ignorecase smartcase
set incsearch hlsearch
set gdefault

" set textwidth=0

" Other Configurations
set ruler laststatus=2 showcmd showmode
set list listchars=trail:»,tab:»-
set fillchars+=vert:\ 
set wrap breakindent
set title

set backspace=indent,start,eol                     " <BS> 역할설정, eol 제외
set scrolloff=5                                    " during scroll keep 3 lines be shown"
set laststatus=2                                   " always show status line
set cursorline                                     " highlight the line with a cursor
set list
set listchars=tab:▸\ ,trail:⋅,extends:>,precedes:<,eol:¬,nbsp:_

" AutoComplPop Plugin 관련 설정: {{{
" 타이핑을 시작하면 자동으로 팝업메뉴가 떠서 선택할 수 있는 플러그인
set complete+=kspell
set completeopt=menuone,longest
set shortmess+=c

" Navigate the complete menu items like CTRL+n / CTRL+p would.
inoremap <expr> <Down> pumvisible() ? "<C-n>" :"<Down>"
inoremap <expr> <Up> pumvisible() ? "<C-p>" : "<Up>"

" Select the complete menu item like CTRL+y would.
inoremap <expr> <Right> pumvisible() ? "<C-y>" : "<Right>"
inoremap <expr> <CR> pumvisible() ? "<C-y>" : "<CR>"

" Cancel the complete menu item like CTRL+e would.
inoremap <expr> <Left> pumvisible() ? "<C-e>" : "<Left>"

" Disable cursor line highlighting in Insert mode
augroup aug_cursor_line
   au!
   au InsertEnter * setlocal nocursorline
   au InsertLeave * setlocal cursorline
augroup END
"}}}

"}}}

" Custom Key Mappings: {{{

" Set <leader> key to <Space>
nnoremap <Space> <Nop>
let mapleader=" "
let maplocalleader=","

" iPad를 위해 <ESC>를 키 매핑, 무척 편리함. set paste와 같이 쓸 경우 안됨.
inoremap jk <ESC>

" Open terminal : i로 시작, exit로 빠져나옴
nmap <leader>s <C-w>s<C-w>j:terminal<CR>
nmap <leader>vs <C-w>v<C-w>l:terminal<CR>

" CtrlSF keymapping
nmap     <C-F>f <Plug>CtrlSFPrompt
vmap     <C-F>f <Plug>CtrlSFVwordPath
vmap     <C-F>F <Plug>CtrlSFVwordExec
nmap     <C-F>n <Plug>CtrlSFCwordPath
nmap     <C-F>p <Plug>CtrlSFPwordPath
nnoremap <C-F>o :CtrlSFOpen<CR>
nnoremap <C-F>t :CtrlSFToggle<CR>
inoremap <C-F>t <Esc>:CtrlSFToggle<CR>

" }}}

" Plugin: {{{

call plug#begin('~/.config/nvim/plugged')

	" Vim Make Pretty:
	" Plug 'morhetz/gruvbox'
	Plug 'sainnhe/gruvbox-material'
	" Plug 'chriskempson/tomorrow-theme', { 'rtp': 'vim' }
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'ryanoasis/vim-devicons'
    	" Plug 'folke/tokyonight.nvim', { 'branch': 'main' }

	" For rapid install exclude some themes
    	" Plug 'sainnhe/forest-night'                    " my favorit colorscheme
	" Plug 'nightsense/nemo'                         " theme
	" Plug 'nightsense/forgotten'
	" Plug 'yuttie/hydrangea-vim'                    " theme
	" Plug 'rhysd/vim-color-spring-night'            " theme

	Plug 'mhinz/vim-startify'                        " fancy start screen for vim
	" Plug 'junegunn/goyo.vim'
	" Plug 'junegunn/limelight.vim'
	" Plug 'junegunn/vim-journal'
	
	" Shell:
	Plug 'scrooloose/nerdtree'
	Plug 'samoshkin/vim-lastplace'                 " 파일을 열때 마지막 상태로 불러들임
	Plug 'vim-scripts/CursorLineCurrentWindow'
	Plug 'tpope/vim-obsession'                     " write current state of vim: window position, open folds
	" Plug 'tpope/vim-sensible'

	" Search:
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'
	" Plug 'junegunn/vim-slash'                    " 검색된 결과를 강조(highlight), 커서가 벗어나면 강조해제
	Plug 'dyng/ctrlsf.vim'                       " :CtrlSF {pattern} ~/Sync
	Plug 'justinmk/vim-sneak'					 " rapid jump around buffer
	
	" GIT:
	Plug 'tpope/vim-fugitive'
	Plug 'junegunn/gv.vim'                       " git commit browser :GV | GV! | GV?
	Plug 'airblade/vim-gitgutter'                " show git diff in the 'gutter' (sign colume)

    " Keyboard:
	" Plug 'SirVer/ultisnips'
	" Plug 'honza/vim-snippets'
	" Plug 'mg979/vim-visual-multi', {'branch': 'master'}
	" Plug 'ervandew/supertab'
	Plug 'tpope/vim-commentary'
	" Plug 'tpope/vim-surround'                    " surroundings: parentheses, brackets, quotes, XML tabs and more
	                                             " cs"'|cs'<q>|ysiw]|cs]{|yssb
                                                 " or yss)|ysiw<em>|visual mode S<p class="important">
	Plug 'jiangmiao/auto-pairs'                  " pair brackets,parens,quotes
        Plug 'vim-scripts/AutoComplPop'              " https://www.youtube.com/watch?v=2f8h45YR494

	" Display:
	" Plug 'junegunn/rainbow_parentheses.vim'      " 중첩된 괄호를 색깔별로 표시
	" Plug 'Yggdroot/indentLine'					 " display indent line
	" Plug 'dkarter/bullets.vim'                    " plugin settings 참조

	" VimWiki:
	Plug 'vimwiki/vimwiki'                       " <leader>ww|wt|w<leader>
	Plug 'mattn/calendar-vim'
	Plug 'tpope/vim-speeddating'

call plug#end()

" }}}

" Simple Plugin Configuration: {{{
"
" Color Scheme Settings :Colors로 변경 가능
colorscheme gruvbox-material
" colorscheme Tomorrow-Night

" Airline
let g:airline_powerline_fonts = 1
let g:airline_section_z = ' %{strftime("%-I:%M %p")}'
let g:airline_section_warning = ''

" Supertab
let g:SuperTabDefaultCompletionType = "<C-n>"

" vim-sneak: sab --> ab 발생장소에 특정 기호가 표시됨, 이동 용이
let g:sneak#label = 1

" Ultisnips
let g:UltiSnipsExpandTrigger="<C-Space>"
let g:UltiSnipsJumpForwardTrigger="<Tab>"
let g:UltiSnipsJumpBackwardTrigger="<C-x>"
" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsListSnippets="<C-p>"
" let g:UltiSnipsJumpBackwardTrigger="<S-tab>"
let g:UltiSnipsEditSplit = 'vertical'
let g:UltiSnipsSnippetDirectories=[$HOME.'/.config/nvim/UltiSnips']

" indentLine
let g:indentLine_char = '▏'
let g:indentLine_color_gui = '#363949'

" fzf-vim
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit' }
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'Type'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Character'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Filetype-Specific Configurations
" Markdown and Journal
autocmd FileType markdown setlocal shiftwidth=4 tabstop=4 softtabstop=4
" autocmd FileType journal setlocal shiftwidth=2 tabstop=2 softtabstop=2

" }}}

" Folding: {{{

" 속도 문제가 발생, 파일오픈 시 unfolded로 불러들임.
set foldenable
set foldmethod=marker
set foldlevelstart=3
" set foldcolumn=1

" What triggers automatic fold opening
set foldopen-=block
set foldopen-=hor
set foldopen+=jump

" Remap because 'za' is highly inconvenient to type
nnoremap <leader><Space> za
" Remap folds everything all the way: fold-close-all
nnoremap <leader>za zM
" Close all folds except the one under the cursor, and center the screen
" nnoremap <leader>fce zMzvzz

" }}}

" Window Management: {{{
" 적응해서 사용하기: 괜찮은 것 같음
" Navigate between windows
noremap <silent> <C-k> :wincmd k<CR>
noremap <silent> <C-j> :wincmd j<CR>
noremap <silent> <C-h> :wincmd h<CR>
noremap <silent> <C-l> :wincmd l<CR>

" Use <Bslash> instead of <C-w>, which is tough to type
nmap <Bslash> <C-w>

" Splits : default splitabove
set splitbelow
set splitright
nnoremap <silent> <leader>_ :split<CR>
nnoremap <silent> <leader>\| :vsplit<CR>
nnoremap <silent> <leader>0 :only<CR>

" Maximize split
" Use '<C-w>=' to make window sizes equal back
nnoremap <C-w><Bslash> <C-w>_<C-w>\|

" Tab navigation
nnoremap <silent> <leader>1 :tabnext 1<CR>
nnoremap <silent> <leader>2 :tabnext 2<CR>
nnoremap <silent> <leader>3 :tabnext 3<CR>
nnoremap <silent> <leader>4 :tabnext 4<CR>
nnoremap <silent> <leader>5 :tabnext 5<CR>
nnoremap <silent> <leader>9 :tablast<CR>

" Or use built-in gt/gT to traverse between tabs
nnoremap <silent> ]<Tab> :tabnext<CR>
nnoremap <silent> [<Tab> :tabprev<CR>

" Tab management
nnoremap <silent> <leader>+ :tabnew<CR>:edit .<CR>
nnoremap <silent> <leader>) :tabonly<CR>
nnoremap <silent> <leader>- :tabclose<CR>

" <C-w>T, moves window to a new tab (built-in)
" <C-w>t, copies window to a new tab
" NOTE: Hides original <C-w>t behavior to move to the topmost window
nnoremap <C-w>t :tab split<CR>

" Cycle between main and alternate file
nnoremap <C-w><Tab> <C-^>zz

" Resize windows
" in steps greather than just 1 column at a time
let _resize_factor = 1.2
nnoremap <C-w>> :exe "vert resize " . float2nr(round(winwidth(0) * _resize_factor))<CR>
nnoremap <C-w>< :exe "vert resize " . float2nr(round(winwidth(0) * 1/_resize_factor))<CR>
nnoremap <C-w>+ :exe "resize " . float2nr(round(winheight(0) * _resize_factor))<CR>
nnoremap <C-w>- :exe "resize " . float2nr(round(winheight(0) * 1/_resize_factor))<CR>

augroup aug_window_management
  au!

  " Detect when window is closed and fire custom event
  au BufWinEnter,WinEnter,BufDelete * call s:CheckIfWindowWasClosed()
  au User OnWinClose call s:Noop()

  " Make all windows of equal size on Vim resize
  au VimResized * wincmd =
augroup END

" Detect when window in a tab was closed
" Vim does not have WinClose event, so try to emulate it
" NOTE: does not work when non-current window gets closed
" See: https://github.com/vim/vim/issues/742
function! s:CheckIfWindowWasClosed()
  " Check if previous window count per tab is greather than current window count
  " It indicates that window was closed
  if get(t:, 'prevWinCount', 0) > winnr('$')
    doautocmd User OnWinClose
  endif

  let t:prevWinCount = winnr('$')
endfunction

function s:Noop()
endfunction

" }}}


" FZF: command-line fuzzy finder {{{
" fzf command-line {{{
" Ctrl-T : paste the selected files and directories on to the command-line
"	- FZF_CTRL_T_COMMAND : to override the default command
"	- FZF_CTRL_T_OPTS : to pass additional options
" CTRL-R : paste the selected command from history onto the command-line
"	- FZF_CTRL_R_OPTS : to pass additional options
" ALT-C : cd into the selected directory
"	- FZF_ALT_C_COMMAND : to oerverride the default command
"	- FZF_ALT_C_OPTS : to pass additional options
" }}} 
" fzf.vim 명령어 설명 {{{
" :Files [PATH]		Files, runs $FZF_DEFAULT_COMMAND if defined
" :GFiles [OPTS]	git ls-files
" :GFiles?			git status
" :Buffers			open buffers
" :Colors			color schemes
" :Ag [PATTERN]		ag search result (ALT-A select all, ALT-D deselect all)
" :Rg [PATTERN]		rg search result (ALT-A, ALT-D)
" :Lines [QUERY]	lines in loaded buffers
" :BLines [QUERY]	Lines in the current buffer
" :Tags, BTags		tags in the project (ctags -R)
" :Marks
" :Windows
" :History
" :Snipopets		snippets (UltiSnips)
" :Commitsi			git commits (requires fugitive.vim)
" :Maps
" :Filetypes
" }}}
" global option variables
let g:fzf_buffers_jump = 1

" only searches inside ~/projects directory
" command! -bang ProjectFiles call fzf#vim#files({'~/FutureIM','~/.config'}, <bang>0)

" use bat for syntax highlighting <-- bat 설치 필요함.
" :Files 명령어로 팝업창에서 파일내용을 확인 할 수 있는 예제
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)

" 위의 예제와 같은 결과, 단 ~/.config/nvim/plugged/fzf.vim/bin/preview.sh와
" 같이 하드코딩을 하지 않아서 호환성을 높임
" command! -bang -nargs=? -complete=dir Files
"     \ call fzf#vim#files(<q-args>, {'options': ['--layout=reverse', '--info=inline', '--preview', '~/.config/nvim/plugged/fzf.vim/bin/preview.sh {}']}, <bang>0)

" advanced ripgrep integration
function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

" Rg command wioth preview window
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)
"
" }}}

" PLUGIN: vim-commentary {{{

" add comment string as filetype
autocmd FileType vim setlocal commentstring=\"\ %s

" Comment line and move 1 line down
nmap <silent> <leader>c <Plug>CommentaryLine :normal j<CR>
xmap <leader>c <Plug>Commentary

" }}}

" PLUGIN: junegunn/goyo.vim {{{

let g:limelight_default_coefficient = 0.7
let g:limelight_priority = -1
let g:goyo_width = 99

" inside tmux
function! s:goyo_enter()
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status off
    silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  endif
  set noshowmode
  set noshowcmd
  set scrolloff=999
  Limelight
  " ...
endfunction

function! s:goyo_leave()
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status on
    silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  endif
  set showmode
  set showcmd
  set scrolloff=5
  Limelight!
  " ...
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

" }}}

" PLUGIN: VimWiki {{{

" disable folding: '', 'expr', 'synctax', 'list'
let g:vimwiki_folding = ''
let g:vimwiki_global_ext=0
let g:vimwiki_hl_cb_checked=2
let g:vimwiki_listsyms = '✗○◐●✓'

" change [Enter] key to <leader>ll
nmap <leader>l <Plug>VimwikiFollowLink
nmap <localleader>l <Plug>VimwikiFollowLink
" <tab> 키를 이용한 table 정렬을 취소
let g:vimwiki_table_mappings = 0
let g:vimwiki_conceallevel = 2

" vimwiki를 위한 wrap 설정
au BufRead,BufNewFile *.wiki setlocal textwidth=99
au BufRead,BufNewFile *.wiki setlocal formatoptions+=w
au BufRead,BufNewFile *.md setlocal textwidth=99
au BufRead,BufNewFile *.md setlocal formatoptions+=w

" VimWikiWrap
nnoremap <leader>vww gqip
nnoremap <leader>vdg :VimwikiDiaryGenerateLinks<CR>

" syncthing 공유 폴더를 활용
" 두개의 wikilist를 사용, 두번째는 huahan 전용 markdown syntax 사용
let g:vimwiki_list = [
      \{
      \  'path'               : '~/FutureIM/VimWiki/',
      \  'syntax'             : 'markdown',
      \  'ext'                : '.md',
      \  'auto_diary_index'   : 1,
      \},
      \{
      \  'path'               : '~/FutureIM/PatientsNotes/',
      \  'auto_tags'          : 1,
      \  'auto_diary_index'   : 1,
      \},
      \{
      \  'path'               : '~/FutureIM/BuildDream/',
      \  'auto_tags'          : 1,
      \  'auto_diary_index'   : 1,
      \},
\]

hi VimwikiHeader1 cterm=bold term=bold gui=bold guifg=#FF7B25
hi VimwikiHeader2 cterm=bold term=bold gui=bold guifg=#82B74B
hi VimwikiHeader3 cterm=bold term=bold gui=bold guifg=#92A8D1
hi VimwikiHeader4 cterm=bold term=bold gui=bold guifg=#F18973
hi VimwikiHeader5 cterm=bold term=bold gui=bold guifg=#F4A688
hi VimwikiHeader6 cterm=bold term=bold gui=bold guifg=#B8A9C9

" }}}

" NERDTree: {{{

let g:NERDTreeDirArrowExpandable = '↠'
let g:NERDTreeDirArrowCollapsible = '↡'
let NERDTreeQuitOnOpen=1                            " automatically close tree after file is opened from it
let NERDTreeNaturalSort=1                           " sort files with numbers naturally
let NERDTreeShowHidden=1                            " show hidden files by default
let NERDTreeMinimalUI=1                             " minimal UI, do not show bookmars and help blocks
let NERDTreeWinSize=40                              " increase tree explorer split ( default is 31 )
let NERDTreeAutoDeleteBuffer=1                      " automatically delete buffer when file is deleted from the tree explorer

noremap  <leader>ne :NERDTreeToggle<CR>
nnoremap <leader>nf :NERDTreeFind<CR>

" Open and preview in splits
let g:NERDTreeMapOpenSplit="s"
let g:NERDTreeMapPreviewSplit="S"
let g:NERDTreeMapOpenVSplit="v"
let g:NERDTreeMapPreviewVSplit="V"

" Open and preview in current window
let g:NERDTreeMapActivateNode="o"
let g:NERDTreeMapPreview="O"

" Do not show '.git' directories, in addition to what specified in .gitignore
let NERDTreeIgnore=['\~$', '^\.git$[[dir]]']

" Tweak status line, so it shortens path if it's under HOME directory
let g:NERDTreeStatusline="%{exists('b:NERDTree')? fnamemodify(b:NERDTree.root.path.str(), ':p:~') :''}"

" }}}

" Vim_Auto_Save: {{{

" enable autosave on vim startup
let g:auto_save = 1
let g:auto_save_events=["InsertLeave", "TextChanged"]

" }}}

" Calendar_vim: {{{

let g:calendar_datetime = 'statusline'
let g:calendar_number_of_months = 5
let g:calendar_diary=$HOME.'/Sync/wiki/diary'
let g:calendar_wruler = '일 월 화 수 목 금 토'
let g:calendar_monday = 1

" }}}

" GitGutter: {{{

set signcolumn=yes
let g:gitgutter_terminal_reports_focus = 0

" fugitive
" View GIT index window
nnoremap <silent> <leader>gs :Gstatus<CR>

" Use <leader>ge to return to working tree version from blob, blame, log
nnoremap <silent> <leader>ge :Gedit<CR>

" Undo changes in working tree
" nnoremap <silent> <leader>gu :Git checkout HEAD -- %:p<CR>
nnoremap <silent> <leader>gu :Gread<CR>
xnoremap <silent> <leader>gu :Gread<CR>

" Commit changes
nnoremap <silent> <leader>gca :Gcommit --all --verbose<CR>
nnoremap <silent> <leader>gcf :Gcommit --amend --reuse-message HEAD<CR>
nnoremap <silent> <leader>gcf :Gcommit --amend --verbose<CR>

" Diff working tree vs index vs HEAD
nnoremap <silent> <leader>gdw :Gdiff<CR>
nnoremap <silent> <leader>gdh :Gdiff HEAD<CR>
nnoremap <silent> <leader>gdi :Gdiff --cached HEAD<CR>

" gla, gva, list (a)ll commits
nnoremap <silent> <leader>gla :Commits<CR>
nnoremap <silent> <leader>gva :GV<CR>

" glf, gvf, list commits touching current (f)ile
nnoremap <silent> <leader>glf :BCommits<CR>
nnoremap <silent> <leader>gvf :GV!<CR>
xnoremap <silent> <leader>gvf :GV<CR>

" gls, gvs, list commits touching current file, but show file revisions or (s)napshots (populates quickfix list)
nnoremap <silent> <leader>gls :silent! Glog<CR><C-l>
nnoremap <silent> <leader>gvs :GV?<CR>

" glF, list commits touching current file, show full commit objects (using vim-fugitive)
nnoremap <silent> <leader>glF :silent! Glog -- %<CR><C-l>

" Change branch
nnoremap <silent> <leader>gco :Git checkout<Space>

" }}}

" Bullets: automated bullet lists {{{

" file types
let g:bullets_enabled_file_types = [
    \ 'markdown',
    \ 'vimwiki',
    \ 'text',
    \ 'gitcommit',
    \ 'scratch'
    \]

" diable for empty buffers (no filetype)
let g:bullets_enable_in_empty_buffers = 0        " default = 1

" enable/disable default key mappings
let g:bullets_set_mappings = 0                   " default = 1

" add a leader key before default mappings:
let g:bullets_mapping_leader = '<M-b>'           " default = ''

" Enable/disable deleting the last empty bullet when hitting <cr> (insert mode) or o (normal mode):
let g:bullets_delete_last_bullet_if_empty = 0    " default = 1

" Line spacing between bullets (1 = no blank lines, 2 = one blank line, etc.):
let g:bullets_line_spacing = 2                   " default = 1

let g:bullets_pad_right = 0                        " bullet 이후 공백자동 추가(안함)
let g:bullets_max_alpha_characters = 1             " a --> z, aa, ab (z까지만 사용)
let g:bullets_outline_levels = ['ROM', 'ABC', 'num', 'abc', 'rom', 'std-', 'std*', 'std+'] 
                                                   " default : bullet으로 사용가능한 종류
let g:bullets_renumber_on_change = 1               " default = 1
let g:bullets_nested_checkboxes = 1                " default = 1
let g:bullets_checkbox_markers = ' .oOX'           " <leader>x
" let g:bullets_checkbox_markers = '✗○◐●✓'
let g:bullets_checkbox_partials_toggle = 1         " default = 1

" Mappings
" Insert new bullet in INSERT mode: <cr> (Return key)
" Same as in case you want to unmap in INSERT mode (compatibility depends on your terminal emulator): <C-cr>
" Insert new bullet in NORMAL mode: o
" Renumber current visual selection: gN
" Renumber entire bullet list containing the cursor in NORMAL mode: gN
" Toggle a checkbox in NORMAL mode: <leader>x
" Demote a bullet (indent it, decrease bullet level, and make it a child of the previous bullet):
"     NORMAL mode: >>
"     INSERT mode: <C-t>
"     VISUAL mode: >
" Promote a bullet (unindent it and increase the bullet level):
"     NORMAL mode: <<
"     INSERT mode: <C-d>
"     VISUAL mode: >

" }}}


" 자동완성 기능 활용 {{{

" 눈성형 관련 시술
iabbr des         Double Eyelidplasty
iabbr 쌍꺼풀수술  Double Eyelidplasty
iabbr ㅆㄲㅍ      Double Eyelidplasty
iabbr 앞트임수술  Medial Epicanthoplasty
iabbr ub          Upper Blepharoplasty
iabbr 상안검수술  Upper Blepharoplasty
iabbr lb          Lower Blepharoplasty
iabbr 하안검수술  Lower Blepharoplasty
iabbr mepi        Medial Epicanthoplasty
iabbr 뒷트임      Lateral Epicanthoplasty
iabbr lepi        Lateral Epicanthoplasty

" 코성형 관련 시술
iabbr 융비술      Augmentation Rhinoplasty
iabbr 매부리제거  Hump Reduction
iabbr 비익축소    Nasal Alar Reduction
iabbr 귀연골      Concha Cartilage
iabbr 비중격      Nasal Septum
iabbr 늑연골      Costal Cartilage
iabbr 인공늑연골  Demineralized Bone
iabbr 동종늑연골  Alloo-Rib Cartilage Graft

" 가슴성형 관련 시술
iabbr 유방확대    Augmentation Mammoplasty
iabbr 가슴확대    Augmentation Mammoplasty
iabbr 유방축소    Reduction Mammoplasty
iabbr 가슴축소    Reduction Mammoplasty

" 안면 거상 및 지방 이식
iabbr 안면거상    Facelift
iabbr 이마거상    Forehead Lift
iabbr 목거상      Neck Lift

" 지방 흡입/이식 및 body contouring
iabbr 지방흡입    Liposuction
iabbr 복부성형    Abdominoplasty
iabbr 지방이식    Fat Graft

" 기타
iabbr 귀족수술    Perinasal Augmentation
iabbr 앞턱수술    Genioplasty

" 단축어
iabbr augm        Augmentation
iabbr redu        Reduction
iabbr medi        Medial
iabbr late        Lateral
iabbr epic        Epicanthoplasty
iabbr endo        Endoscopic
iabbr revi        Revision
iabbr rhin        Rhinoplasty
iabbr mamm        Mammoplasty
iabbr fatg        Fat Graft
iabbr lipo        Liposuction

iabbr <expr> _date         strftime('%Y-%m-%d')：
iabbr <expr> _time         strftime('%H:%M:%S')
iabbr <expr> _dtime        strftime('%Y-%m-%d %H:%M:%S')

" 직원
iabbr ywy         闫文云医生
iabbr yanwenyun   闫文云医生
iabbr 얜원윈      闫文云医生
iabbr sbx         史冰心主任
iabbr shibingxin  史冰心主任
iabbr 상담실장    咨询医生
iabbr 왕링        王玲
iabbr wangling    王玲
iabbr 왕징        王静
iabbr wangjing    王静
iabbr 장위에      张悦
iabbr zhangyue    张悦
iabbr 란롱롱      兰蓉蓉
iabbr lanrongrong 兰蓉蓉
iabbr 란자오시아  兰朝霞
iabbr lanzhaoxia  兰朝霞
iabbr 통역        兰朝霞

" }}}

