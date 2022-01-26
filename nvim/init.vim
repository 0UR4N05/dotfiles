:set number
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set mouse=a
set nocompatible

" installing plugins
call plug#begin()
Plug 'sheerun/vim-polyglot'		"syntax hylighting
Plug 'ryanoasis/vim-devicons'
Plug 'hrsh7th/nvim-cmp'         "auto completion 
Plug 'jiangmiao/auto-pairs'		"Pair completion when typing brackets
Plug 'romgrk/barbar.nvim'		"the tabbar
Plug 'joshdick/onedark.vim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'Pocco81/AutoSave.nvim'
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
