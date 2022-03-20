:set number
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set mouse=a
set nocompatible

" installing plugins
call plug#begin('/home/ouranos/.config/nvim/plugged')
Plug 'sheerun/vim-polyglot'		"syntax hylighting
Plug 'ryanoasis/vim-devicons'
Plug 'jiangmiao/auto-pairs'		"Pair completion when typing brackets
Plug 'kyazdani42/nvim-web-devicons'
Plug 'Pocco81/AutoSave.nvim'
Plug 'preservim/nerdtree'		" nerd tree
Plug 'neoclide/coc.nvim'		" fucking auto completion
Plug 'catppuccin/nvim', {'as': 'catppuccin'}   "theme 
Plug 'nvim-lualine/lualine.nvim'			" bar
Plug 'akinsho/toggleterm.nvim'		
Plug 'ahonn/vim-fileheader'				" inserting 
call plug#end()
set encoding=UTF-8

syntax on

" autosave shit 
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
" vim colors 
"set termguicolors
" colorscheme yourfavcolorscheme
" auto completion using tab 
inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>"

" theme 
lua << EOF
local catppuccin = require("catppuccin")
-- configure it
catppuccin.setup(<settings>)
EOF
colorscheme catppuccin

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
map <C-n> :NERDTreeToggle<CR>
" inserting the header
map <C-h> :AddFileHeader<CR>
map <C-u> :UpdateFileHeader<CR>

" integrated terminal 
require("toggleterm").setup{}
nnoremap <silent><c-t> <Cmd>exe v:count1 . "ToggleTerm"<CR>
inoremap <silent><c-t> <Esc><Cmd>exe v:count1 . "ToggleTerm"<CR>
