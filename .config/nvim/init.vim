call plug#begin("~/.vim/plugged")

  Plug 'vim-scripts/c.vim'
  
  " Latex support
  Plug 'lervag/vimtex'
  let g:tex_flavor='latex'
  let g:vimtex_view_method='zathura'
  let g:vimtex_quickfix_mode=0
  set conceallevel=1
  let g:tex_conceal='abdmg'
  let g:vimtex_compiler_latexmk = {
      \ 'build_dir' : 'output',
  \}

  " Pandoc Markdown support
  Plug 'vim-pandoc/vim-pandoc'
  Plug 'vim-pandoc/vim-pandoc-syntax'

  " Snippets
  Plug 'SirVer/ultisnips'

  " Language support
  Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
  let g:coc_global_extensions = ['coc-tslint-plugin', 'coc-tsserver', 'coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-yank', 'coc-prettier', 'coc-java', 'coc-prettier']
  command! -nargs=0 Prettier :call CocAction("runCommand", "prettier.formatFile")

  " Rust support
  Plug 'rust-lang/rust.vim'

  " Flutter support
  Plug 'dart-lang/dart-vim-plugin'
  Plug 'thosakwe/vim-flutter'

  " (J|T)SX? support
  Plug 'mxw/vim-jsx'
  Plug 'ianks/vim-tsx'
  Plug 'leafgarland/typescript-vim'

  " Prettier
  " Plug 'prettier/vim-prettier', { 'do': 'yarn install', 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
  " let g:prettier#autoformat = 1

  " Tree File View
  Plug 'scrooloose/nerdtree'
  let NERDTreeIgnore = ['\.pyc$', '\.class$']

  " Themes
  Plug 'mhartington/oceanic-next'
  Plug 'Rigellute/shades-of-purple.vim'
  Plug 'kaicataldo/material.vim'

  " Fuzzy Search
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  " FZF key bindings
  nnoremap <C-f> :FZF<CR>
  let g:fzf_action = {
    \ 'ctrl-t': 'tab split',
    \ 'ctrl-i': 'split',
    \ 'ctrl-v': 'vsplit' }

  " Disable repeated hjkl and arrow keys
  " Plug 'takac/vim-hardtime'
  " let g:hardtime_default_on = 1

  " for writing, to toggle, type :Goyo
  Plug 'junegunn/goyo.vim'
  
  " Vim surround
  Plug 'tpope/vim-surround'
call plug#end()

" Enable theming support
if (has("termguicolors"))
 set termguicolors
endif

" Theme
syntax enable
colorscheme material

" Automatically update on change
autocmd TextChanged,TextChangedI <buffer> silent update

" Style preferences
set tabstop=2 shiftwidth=2 expandtab number relativenumber

" Spell check
set spelllang=en_gb
" Automatically enable spell check in the given file types
autocmd FileType latex,tex,md,markdown setlocal spell
" Automatically compile markdown files
"autocmd BufWritePost *.md silent execute "!pandoc % -o %:r.pdf"
command PandocPDF silent execute "!pandoc % -o %:r.pdf"
map <F6> :PandocPDF<CR>
" For opening markdown files in zathura
command Zathura execute "!zathura %:r.pdf"
map <F5> :Zathura<CR>
