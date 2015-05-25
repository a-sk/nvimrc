let s:darwin = has('mac')
let g:python_host_prog = '/usr/local/bin/python'

" Load bundles {{{

if has('vim_starting')
    source $HOME/.nvim/plugs.vim
endif

" }}}


" Options {{{

set clipboard=unnamed
set nrformats= " treat all numerals as decimal

" Search {{{
set ignorecase " Ignore the case of normal letters.
set smartcase  " OVERRIDE IGNORECASE IN CASE
set incsearch  " Enable incremental search.
set hlsearch   " highlight search result.
set wrapscan   " Searches wrap around the end of the file.
"}}}

" Edit {{{
set spelllang=en,ru
set encoding=utf-8             " Set default encoding to UTF-8
set smarttab
set expandtab                  " Exchange tab to spaces.
set softtabstop=4              " Spaces instead <Tab>.
set tabstop=4
set shiftwidth=4               " Autoindent width.
set shiftround                 " Round indent by shiftwidth.
set backspace=indent,eol,start " Enable backspace delete indent and newline.
set showmatch                  " Highlight parenthesis.
set matchtime=3                " time to show the matching paren
set matchpairs+=<:>            " Highlight <>.
set infercase                  " Ignore case on insert completion
set foldenable
set isfname-==                 " Exclude = from isfilename
set virtualedit=block
set keywordprg=:help           " Set keyword help used by K
set updatetime=500             " CursorHold time.
set nojoinspaces
set autoread
set autoindent
set smartindent
"}}}

" Backup {{{
set writebackup                      " Make a backup of the original file when writing
set backup                           " and don't delete it after a succesful write.
set backupext=~                      " Backup for file is file~
set undofile                         " Set undofile.
set undodir=~/var/nvim/undo          " Set undo directory
set backupdir=~/var/nvim/backup/     " where to put backup files.
set backupskip=/tmp/*,/private/tmp/* " Make Vim able to edit crontab files again.
set noswapfile
"}}}

" Buffer {{{
set switchbuf=useopen,usetab " jump to already opened instead open new
set hidden                   " Display another buffer when current buffer isn't saved.
"}}}

" View {{{
set number                              " Show line number.
set relativenumber
set ruler                               " Show line and column number
set wrap                                " Wrap long line.
set whichwrap+=h,l,<,>,[,],b,s,~        " Wrap conditions.
set laststatus=2                        " Always display statusline.
set cmdheight=1                         " Height of command line.
set showcmd                             " Show command on statusline.
set shortmess=atI                       " Do not display greetings message at the time of Vim start.
set visualbell                          " Disable bell.
set vb t_vb=
set history=500                         " Increase history amount.
set undolevels=200                      " Set undo level depth
set showfulltag                         " Display all the information of the tag by the supplement of the Insert mode.
set completeopt=longest,menuone         " Completion setting.
set complete=.,w,b,u,t                  " complete from other buffer.
set pumheight=20                        " Set popup menu max height.
set report=0                            " Report changes.
set nostartofline                       " Maintain a current line at the time of movement as much as possible.
set noequalalways                       " No equal window size.
set previewheight=10                    " Adjust window size of preview and help.
set helpheight=12
set splitbelow                          " Splitting a window will put the new window below the current one.
set splitright                          " Splitting a window will put the new window right the current one.
set winwidth=60                         " Set minimal width for current window.
set winheight=20                        " Set minimal height for current window.
set cmdwinheight=5                      " Set maximam maximam command line window.
set lazyredraw                          " Don't redraw while macro executing.
set display=lastline                    " When a line is long, do not omit it in @.
set formatoptions+=mM                   " Enable multibyte format.
set list                                " Show invisible characters
set listchars=                          " " " Reset the listchars
set listchars=tab:\ \                   " a tab should display as  " "
set listchars+=trail:.                  " show trailing spaces as dots
set listchars+=extends:>                " The character to show in the last column when wrap is
set listchars+=precedes:<               " The character to show in the last column when wrap is
set fillchars=diff:⣿,vert:│             " Characters to fill the statuslines and vertical separators
set titlelen=95                         " Title length.
set textwidth=0
set colorcolumn=85                      " Highlight 85-th column
set conceallevel=2 concealcursor=n     " For conceal.
set synmaxcol=1000
"set t_Co=16
set nocursorline

" For MacVim
if s:darwin
    set noimd
    set imi=1
    set ims=-1
endif

source ~/.nvim/colorscheme   " read colorscheme from file

set statusline=%<[%n]\ %F\ %m%r%y\ %{exists('g:loaded_fugitive')?fugitive#statusline():''}\ %=%-14.(%l,%c%V%)\ %P

"}}}

" Wildmenu completion {{{
set wildmenu
set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.DS_Store                       " OSX bullshit
set wildignore+=*.luac                           " Lua byte code
set wildignore+=migrations                       " Django migrations
set wildignore+=*.pyc                            " Python byte code
set wildignore+=*.orig                           " Merge resolution files"
"}}}

" }}}


" Lang {{{
"
" Javascript {{{
if has("autocmd")
  au FileType javascript nnoremap <silent><buffer> gd :TernDef<CR>
  au FileType javascript nnoremap <silent><buffer> gD :TernDefPreview<CR>
  au FileType javascript nnoremap <silent><buffer> gr :TernRename<CR>

  au FileType json set concealcursor=n
endif

" }}}

" Markdown {{{
function! s:setupWrapping()
  set wrap
  set linebreak
  set textwidth=72
  set nolist
endfunction

if has("autocmd")
  au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn,txt} set ft=markdown | call s:setupWrapping()
endif

" }}}

" Enable marker foldings for vimrc, mbsynrc, etc {{{
if has("autocmd")
  au BufRead,BufNewFile .mbsyncrc set foldmethod=marker
  au FileType vim set foldmethod=marker
endif
" }}}

" }}}


" Mappings {{{

" Space is the new leader {{{
nmap  <Space>   <leader>
xmap  <Space>   <leader>
nnoremap  <leader>   <Nop>
xnoremap  <leader>   <Nop>

"}}}

" {{{ <Leader>s: Spell checking shortcuts
nnoremap <Leader>S :setlocal spell!<cr>
nnoremap <Leader>sn ]s
nnoremap <Leader>sN [s
nnoremap <Leader>sa zg]s
nnoremap <Leader>sd 1z=
nnoremap <Leader>sf z=
" }}}

" Center screen on <C-o>
nnoremap <C-o> <C-o>zz

" Center screen after search
nnoremap n nzzzv
nnoremap N Nzzzv

" Same when jumping around
nnoremap g; g;zz
nnoremap g, g,zz

" Strip all trailing white space
nnoremap <silent> <leader>w  :call Preserve("%s/\\s\\+$//e")<CR>

" Select last pasted text from yank/delete
nnoremap <expr> gV    "`[".getregtype(v:register)[0]."`]"

" Change current directory to basedir
nnoremap <silent> <leader>Cd :lcd %:h<CR>

"Y behave like D, please"
nnoremap Y y$

" Clear search matches higliighting
noremap <leader><esc> :noh<cr>:call clearmatches()<cr>

" Don't move on *
nnoremap * *<c-o>

" Space space to toggle folds.
nnoremap <Leader><Space> za

" Allows to go throw wrapped lines
noremap j gj
noremap k gk

" Easier to type, and I never use the default behavior.
noremap H ^
noremap L g_

" gi already moves to `last place you exited insert mode`, so we'll map gI to
" something similar: move to last change
nnoremap gI `.


" Moving code sideways
nnoremap <silent>< :SidewaysLeft<CR>
nnoremap <silent>> :SidewaysRight<CR>

" Switching opposite values
nnoremap <silent> - :Switch<cr>

" Code docs on <leader>k
nnoremap <silent><leader>k :call investigate#Investigate()<CR>

" Neovim terminal mappings {{{
tnoremap <C-\><C-\> <C-\><C-n>

" }}}
"
" Windows navigation {{{
nnoremap <C-w>' <C-w>p
nmap <silent><leader>o :ZoomWinTabToggle<CR>
" }}}

" Search and replace word under the cursor {{{
map <C-f> <Plug>(FNR%)
xmap <C-f> <Plug>(FNR)
" }}}

" Tmux integration {{{
nnoremap <C-c><C-c> :SlimuxREPLSendLine<CR>
vnoremap <C-c><C-c> :SlimuxREPLSendSelection<CR>
" }}}

" Unite {{{
nnoremap <leader>t :Unite -buffer-name=files" -start-insert -auto-resize -update-time=10 file_rec/async<CR>
nnoremap <leader>T :<C-u>execute "Unite -buffer-name=files -start-insert -auto-resize file_rec/async:" . expand("%:p:h")<CR>
nnoremap <leader>d :Unite -start-insert outline<CR>
nnoremap <leader>r :Unite -start-insert file_mru -update-time=10<CR>
nnoremap <leader>b :Unite -start-insert buffer -auto-resize -update-time=0<CR>
nnoremap <leader>/ :Unite -buffer-name=search line -start-insert<CR>
nnoremap <leader>p :<C-u>:Unite history/yank -buffer-name=yanks<CR>
nnoremap <silent> <Leader>f :<C-u>Unite -buffer-name=find find:.<CR>

nnoremap <leader>a :<C-u>Unite grep:.:: -default-action=above<CR>
nnoremap <leader>A :<C-u>execute 'Unite grep:.::' . expand("<cword>") . ' -default-action=above -auto-preview'<CR>
" }}}

" remap Ultisnips for compatibility for YCM {{{
let g:UltiSnipsExpandTrigger = '<C-j>'
let g:UltiSnipsJumpForwardTrigger = '<C-j>'
let g:UltiSnipsJumpBackwardTrigger = '<C-k>'
" }}}

" Code commenting {{{
vmap <leader>ci <Plug>Commentary
nmap <leader>ci <Plug>CommentaryLine
" }}}

"{{{ Close help and git window by pressing q.
augroup MyAutoCmd
  autocmd FileType help,git-status,git-log,qf,gitcommit,quickrun,qfreplace,ref,simpletap-summary nnoremap <buffer><silent> q :<C-u>close<CR>
  autocmd FileType * if &readonly |  nnoremap <buffer><silent> q :<C-u>close<CR> | endif
augroup END
"}}}

" Visual mode mappings  {{{

vnoremap > >gv
vnoremap < <gv

vnoremap H ^
vnoremap L g_

" Search in the selecteonn
vnoremap / <Esc> /\%V
vnoremap ? <Esc> ?\%V

xnoremap <CR>    c
xnoremap <TAB>   >gv
xnoremap <S-TAB> <gv
"}}}

" Improved * search {{{

map *   <Plug>(asterisk-z*)
map #   <Plug>(asterisk-z#)
map g*  <Plug>(asterisk-g*)
map g#  <Plug>(asterisk-zg#)
" }}}

" }}}


" Commands {{{
command! -range Enumerate
  \	<line1>,<line2>call rengbang#rengbang('^', 1, 1, 1, '%d ')
" }}}


" Plugins options {{{
if s:darwin
    let g:investigate_use_dash=1
endif
let g:indentLine_enabled = 1
let g:airline_powerline_fonts = 1

let g:signify_vcs_list = [ 'git' ]

let g:tmuxcomplete#trigger = 'omnifunc'

let g:grammarous#default_comments_only_filetypes = {
            \ '*' : 1, 'help' : 0, 'markdown' : 0,
            \ }
" Committia {{{
let g:committia_hooks = {}
function! g:committia_hooks.edit_open(info)
    " Additional settings
    setlocal spell

    " If no commit message, start with insert mode
    if a:info.vcs ==# 'git' && getline(1) ==# ''
        startinsert
    end

    " Scroll the diff window from insert mode
    " Map <C-n> and <C-p>
    imap <buffer><C-n> <Plug>(committia-scroll-diff-down-half)
    imap <buffer><C-p> <Plug>(committia-scroll-diff-up-half)

endfunction
" }}}

" Sneak {{{
let g:sneak#streak = 1
" }}}

" Unite {{{

" Use the fuzzy matcher for everything
call unite#filters#matcher_default#use(['matcher_fuzzy'])
" Use the rank sorter for everything
call unite#filters#sorter_default#use(['sorter_rank'])

call unite#custom_source('file_rec/async', 'sorters', ['sorter_length'])
call unite#custom_source('file_rec/async', 'matchers', ['matcher_fuzzy', 'matcher_hide_hidden_files'])
call unite#custom_source('file_rec/async', 'sorters', ['sorter_length'])
call unite#custom_source('file_rec/async', 'converters', ['converter_relative_word'])
call unite#custom_source('file_rec/async', 'max_candidates', 200)

call unite#custom_source('file/mru', 'sorters', ['sorter_length'])
call unite#custom_source('file/mru', 'matchers', ['matcher_fuzzy', 'matcher_hide_hidden_files'])
call unite#custom_source('file/mru', 'sorters', ['sorter_length'])
call unite#custom_source('file/mru', 'converters', ['converter_relative_word'])
call unite#custom_source('file/mru', 'max_candidates', 200)

let g:unite_source_file_rec_ignore_pattern = 'node_modules\|\%(^\|/\)\.$\|\~$\|\.\%(o\|exe\|dll\|bak\|sw[po]\|class\|pyc\)$\|\%(^\|/\)\.\%(hg\|git\|bzr\|svn\)\%($\|/\)'
let g:unite_source_grep_default_opts = '-iRHn --exclude-dir node_modules'
let g:unite_source_history_yank_enable = 1
let g:unite_source_directory_mru_limit = 300
let g:unite_source_file_mru_limit = 300
let g:unite_source_file_mru_filename_format = ':~:.'
let g:unite_source_grep_command = 'ag'
let g:unite_source_grep_default_opts = '--smart-case --nocolor --nogroup --column --ignore node_modules'
let g:unite_source_grep_recursive_opt = ''
let g:unite_source_rec_async_command = 'ag -l . --nocolor'


" }}}

" Pymode {{{

let g:pymode_run_bind = "<leader>pr"
let g:pymode_rope_goto_definition_bind = "gd"
let g:pymode_breakpoint_bind = '<leader>pb'

let g:pymode_lint_checkers = ['pyflakes', 'mccabe']

let g:pymode_rope_autoimport_bind = '<leader>pai'
let g:pymode_rope_organize_imports_bind = '<leader>pi'
"}}}

" Jedi {{{
let g:jedi#use_tabs_not_buffers = 0
let g:jedi#show_call_signatures = 2
let g:jedi#goto_definitions_command = "gd"
let g:jedi#rename_command = ""
let g:jedi#goto_command = ""
"}}}


let g:syntastic_python_python_exec = '/usr/local/bin/python'

let g:syntastic_python_checkers = ['pyflakes', 'mccabe']
let python_highlight_all = 1

let g:indentLine_noConcealCursor = 1

" }}}


" Functions {{{

function! Preserve(command) " {{{
"Preserves/Saves the state, executes a command, and returns to the saved state
"From http://vimcasts.org/episodes/tidying-whitespace/
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  execute a:command
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction
"}}}

" }}}

