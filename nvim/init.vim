""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TODO : 
" separate your neovim on files 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
:set number
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
set autoindent smartindent
:set mouse=a
set nocompatible
set encoding=UTF-8
syntax on

call plug#begin('/home/ouranos/.config/nvim/plugged')
Plug 'ryanoasis/vim-devicons'
Plug 'jiangmiao/auto-pairs'		"Pair completion when typing brackets
Plug 'kyazdani42/nvim-web-devicons'
Plug 'Pocco81/AutoSave.nvim'
Plug 'preservim/nerdtree'		" nerd tree
Plug 'neoclide/coc.nvim'		" fucking auto completion
Plug 'nvim-lualine/lualine.nvim'			" bar
Plug '42Paris/42header'					" header of 42
Plug 'EdenEast/nightfox.nvim' "	theme for nvim 
Plug 'psliwka/vim-smoothie'			" scrolling so fast 
Plug 'akinsho/toggleterm.nvim', {'tag' : 'v2.*'}
call plug#end()

" for autosave
lua << EOF
local autosave = require("autosave")

autosave.setup(
    {
        enabled = true,
        execution_message = "AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S"),
        events = {"InsertLeave", "TextChanged"},
        conditions = {
            exists = true,
            filename_is_not = {},
            filetype_is_not = {},
            modifiable = true
        },
        write_all_buffers = false,
        on_off_commands = true,
        clean_command_line_interval = 0,
        debounce_delay = 135
    }
)
EOF

" auto start nerdtree
autocmd VimEnter * NERDTree
" auto closing nerdtree
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" removing a fucked 'Press ? for help'
let NERDTreeMinimalUI=1

" removing the tidle 
highlight EndOfBuffer ctermfg=black ctermbg=black
" auto completion using tab 
inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>"

" bar 
lua << END
require('lualine').setup()
END


" remapping neovim key, rahad lkeymaps dayrin kizebi
" syntax : {mode}{attribute}map {key} {command}
" changing the navigation keys to i3 
nmap l <Up>
nmap j <Left>
nmap k <Down>
nmap ; <Right>
vmap l <Up>
vmap j <Left>
vmap k <Down>
vmap ; <Right>

" opening and quiting nerdtree using keybindings 
map <C-d> :NERDTreeFocus<CR>
map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1			" show hidden files in nerdtree

"configuration for neovim theme
colorscheme nordfox  
" inserting the header
map <C-h> :AddFileHeader<CR>
map <C-u> :UpdateFileHeader<CR>

# configuring 1337 school shit 
let g:user42 = 'mlalama'
let g:mail42 = 'mlalama@student.42.fr'
map <C-h> :Stdheader<CR>

" pasting to external programs and copying from them since unnamedplus didnt
" work
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>p "+p
vnoremap <leader>p "+p


" scrolling so fast configs
nnoremap <unique> <C-V> <cmd>call smoothie#do("\<C-D>") <CR>
vnoremap <unique> <C-V> <cmd>call smoothie#do("\<C-D>") <CR>


" terminal setuping 
lua << END
require("toggleterm").setup{}
END
map <C-t> :ToggleTerm<CR>

