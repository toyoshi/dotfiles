set nocompatible

set rtp+=~/.vim/vundle/ 
call vundle#rc()

Bundle 'tpope/vim-rails'
Bundle 'unite.vim'
Bundle 'The-NERD-tree'
Bundle 'neocomplcache'
Bundle 'kwbdi.vim'
Bundle 'chrismetcalf/vim-yankring'
Bundle 'thinca/vim-quickrun'
Bundle 'mattn/gist-vim'
Bundle 'mattn/webapi-vim'


"入力モード時、ステータスラインのカラーを変更
augroup InsertHook
    autocmd!
    autocmd InsertEnter * highlight StatusLine guifg=#ccdc90 guibg=#2E4340
    autocmd InsertLeave * highlight StatusLine guifg=#2E4340 guibg=#ccdc90
augroup END

"変更中のファイルでも、保存しないで他のファイルを表示
set hidden
" 「日本語入力固定モード」切替キー
inoremap <silent> <C-j> <C-r>=IMState('FixMode')<CR>
" PythonによるIBus制御指定
let IM_CtrlIBusPython = 1

" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
        let g:neocomplcache_keyword_patterns = {}
    endif
    let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" indent
filetype on
filetype indent on
filetype plugin on

let g:quickrun_config = {}
let g:quickrun_config['ruby.rspec'] = {'command': 'rspec'}
let g:quickrun_config['ruby.cucumber'] = {'command': 'cucumber'}
augroup UjihisaRSpec
	autocmd!
	autocmd BufWinEnter,BufNewFile *_spec.rb set filetype=ruby.rspec
augroup END

set autoindent
set shiftwidth=2

