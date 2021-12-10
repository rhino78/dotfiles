" General
filetype plugin on
filetype indent on
set autoread
let mapleader = " "
set clipboard=unnamedplus
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" UI
syntax on
set ruler
set backspace=eol,start,indent
set ignorecase
set smartcase
set incsearch
set lazyredraw
set nohlsearch
set magic
set showmatch
set foldcolumn=1
set number
set relativenumber
set completeopt=menuone,noinsert,noselect
set shortmess+=c
set previewheight=10
set laststatus=2
set scrolloff=10
set signcolumn=yes

"Files, backups and undo
set nobackup
set nowb
set noswapfile
set hidden
nnoremap <Leader>h <C-w>h
nnoremap <Leader>j <C-w>j
nnoremap <Leader>k <C-w>k
nnoremap <Leader>l <C-w>l

" Text/Indent
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
set ai
set si
set nowrap


" Quick fix
map <C-j> :cn<CR>
map <C-k> :cp<CR>

" Vim Plug
call plug#begin('~/.vim/plugged')
    Plug 'aqez/vim-test'
    Plug 'gruvbox-community/gruvbox'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/nvim-cmp'
    Plug 'hrsh7th/vim-vsnip'
    Plug 'kabouzeid/nvim-lspinstall'
    Plug 'mhinz/vim-startify'
    Plug 'neovim/nvim-lspconfig'
    Plug 'ntpeters/vim-better-whitespace'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope-fzy-native.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'preservim/nerdtree'
    Plug 'puremourning/vimspector'
    Plug 'sonph/onehalf', { 'rtp' : 'vim' }
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-fugitive'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
call plug#end()

colorscheme gruvbox
let g:airline_theme = 'gruvbox'
set background=dark
hi! Normal guibg=NONE ctermbg=NONE

" startify
let g:startify_bookmarks = [ {'c': '~/.config/nvim/init.vim'},{'z':'~/.zshrc'},{'e': '/mnt/d/DeltaV_Core/Code/src/EthernetIO/DeviceSignal.cpp'} ]

nnoremap <leader>s :Startify<CR>

" Vimspector
let g:vimspector_enable_mappings = 'VISUAL_STUDIO'
nnoremap <leader>vr :VimspectorReset<CR>

" Telescope
let $FZF_DEFAULT_COMMAND = 'rg --files'
nmap <Leader>p :Telescope find_files<CR>

" NerdTree
nnoremap <Leader>t :NERDTreeToggle<CR>
let g:NERDTreeQuitOnOpen = 1

lua require("awesomeman")

" Treesitter
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained",
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = true,
  },
}
EOF


" LSP
lua << EOF

 require('telescope').setup {
     defaults = {
         file_sorter = require('telescope.sorters').get_fzy_sorter,
         mappings = {
             i = {
                 ["<C-k>"] = require('telescope.actions').move_selection_previous,
                 ["<C-j>"] = require('telescope.actions').move_selection_next,
             }
         }
     },
     extensions = {
         fzy_native = {
             override_generic_sorter = false,
             override_file_sorter = true
         }
     }
 }
 require('telescope').load_extension('fzy_native')

 local cmp = require'cmp'
  cmp.setup({
    snippet = {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
      end,
    },
    sources = {
        { name = "nvim_lsp" },
        { name = "vsnip" },
        { name = "buffer" }
    }
  })

  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

  local nvim_lsp = require('lspconfig')
  local pid = vim.fn.getpid()
  local omnisharp_bin = "omnisharp"
  nvim_lsp.omnisharp.setup{ cmd = { omnisharp_bin, "--languageserver" , "--hostPID", tostring(pid) }, capabilities = capabilities }
  nvim_lsp.rust_analyzer.setup{ capabilities = capabilities }
  nvim_lsp.clangd.setup{ capabilities = capabilities }
  nvim_lsp.tsserver.setup{ capabilities = capabilities }
  nvim_lsp.cssls.setup{ capabilities = capabilities }
  nvim_lsp.html.setup{ capabilities = capabilities }
EOF

nnoremap gd :Telescope lsp_definitions<CR>
nnoremap <Leader>fi :Telescope lsp_implementations<CR>
nnoremap <Leader>fu :Telescope lsp_references<CR>
nnoremap <leader>cf <cmd>lua vim.lsp.buf.formatting()<CR>
nnoremap <leader><space> :Telescope lsp_code_actions<CR>
vnoremap <leader><space> :Telescope lsp_range_code_actions<CR>
nnoremap <F2> <cmd>lua vim.lsp.buf.rename()<CR>

nnoremap <leader>gs :Telescope git_status<CR>
nnoremap <leader>gb :Telescope git_branches<CR>
nnoremap <leader>gc :Telescope git_commits<CR>
nnoremap K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>

nnoremap <leader>gr :Telescope live_grep<CR>

nnoremap <leader>ev :e $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>


nnoremap <leader>rt :TestNearest<CR>
augroup AWESOMEMAN
    autocmd!
    autocmd BufWritePre lua,cpp,c,h,hpp,cxx,c Neoformat
    autocmd BufWritePre * %s/\s\+$//e
    autocmd BufEnter,BufWinEnter,TabEnter *rs :lua require'lsp_expensions'.inlay_hints{}
augroup END
