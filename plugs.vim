call plug#begin('~/.nvim/plugged')

let s:darwin = has('mac')


Plug 'junegunn/fzf',        { 'do': 'yes \| ./install' }
Plug 'powerman/vim-plugin-ruscmd'
Plug 'troydm/zoomwintab.vim'

" Look {{{
Plug 'altercation/vim-colors-solarized'
Plug 'Yggdroot/indentLine'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle'    }
Plug 'bling/vim-airline'
Plug 'junegunn/rainbow_parentheses.vim'
" }}}

" Edit {{{
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-commentary',        { 'on': '<Plug>Commentary' }
Plug 'mbbill/undotree',             { 'on': 'UndotreeToggle'   }
Plug 'ConradIrwin/vim-bracketed-paste'

Plug 'AndrewRadev/sideways.vim'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'AndrewRadev/switch.vim'
Plug 'dietsche/vim-lastplace'
Plug 'jiangmiao/auto-pairs'
Plug 'airblade/vim-rooter'
Plug 'vim-scripts/CmdlineComplete'
Plug 'junegunn/vim-easy-align', { 'on': ['<Plug>(EasyAlign)', 'EasyAlign'] }
Plug 'tommcdo/vim-exchange'
Plug 'deris/vim-rengbang'
Plug 'wellle/targets.vim'
Plug 'tpope/vim-sleuth'
Plug 'justinmk/vim-sneak'
Plug 'gcmt/wildfire.vim'
Plug 'junegunn/vim-pseudocl'
Plug 'junegunn/vim-fnr'
" }}}

" Browse {{{
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'majutsushi/tagbar'
Plug 'haya14busa/vim-asterisk'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-unimpaired'
Plug 'Konfekt/FastFold'
" }}}

" Unite {{{
Plug 'Shougo/vimproc', {'do': 'make -f make_mac.mak'}
Plug 'Shougo/unite.vim'
Plug 'Shougo/unite-outline'
Plug 'Shougo/neomru.vim'
" }}}

" Completeions {{{
Plug 'Valloric/YouCompleteMe', { 'do': './install.sh' }
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
" }}}

" Git {{{
Plug 'tpope/vim-fugitive'
Plug 'gregsexton/gitv', { 'on': 'Gitv' }
Plug 'mhinz/vim-signify'
Plug 'mattn/webapi-vim'
Plug 'mattn/gist-vim'
Plug 'rhysd/committia.vim'
" }}}

" Lang {{{

Plug 'vim-ruby/vim-ruby'
Plug 'fatih/vim-go'
Plug 'kchmck/vim-coffee-script'
Plug 'plasticboy/vim-markdown'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'wting/rust.vim'
Plug 'honza/dockerfile.vim'
if s:darwin
  Plug 'Keithbsmiley/investigate.vim'
endif
" }}}

" Dev {{{
Plug 'scrooloose/syntastic'
Plug 'calebsmith/vim-lambdify'
" }}}

" Python {{{

Plug 'python_match.vim'
" Plug 'klen/python-mode', { 'branch' : 'develop' }
Plug 'davidhalter/jedi-vim', {'do': 'pip install jedi'}
Plug 'hdima/python-syntax'
Plug 'tmhedberg/SimpylFold'
" }}}

" Javascript {{{

Plug 'pangloss/vim-javascript'
Plug 'marijnh/tern_for_vim'

" }}}

" Tmux {{{
Plug 'epeli/slimux'
Plug 'wellle/tmux-complete.vim'
" }}}

call plug#end()
