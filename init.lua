--GLOBAL VARIABLES
vim.g.VIMOS= ""

function CheckOS()
    if vim.fn.has("win32") == 1 then
        print("Estás en Windows.")
    elseif vim.fn.has("unix") == 1 then
        print("Estás en un entorno Unix (Linux, macOS, etc.).")
    else
        print("No se puede determinar el sistema operativo.")
    end
end

CheckOS()

vim.g.PLUGINSPATH="/lua/plugins.lua"


--SETTINGS
vim.opt.nu = true
vim.opt.guicursor = ""
vim.opt.cursorline = true

--vim.opt.mouse = "v" 
vim.opt.mouse = "a"

vim.opt.clipboard = "unnamedplus"

vim.opt.swapfile = false 

vim.opt.backupdir = "~/.cache/vim"

vim.opt.tabstop=8
vim.opt.expandtab= true
vim.opt.shiftwidth = 4
vim.opt.autoindent = true
vim.opt.smartindent = true

--require'lspconfig'.pyright.setup{}

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
vim.g.mapleader = " "


require("lazy").setup("plugins")

--AFTER PLUGINS CHARGED

vim.cmd.colorscheme("PaperColor")

--ENABLE TO DO SET DEFAULT NEOTREES
--vim.api.nvim_exec([[
--	augroup Mygroup
--	autocmd!
--	autocmd BufNew * Neotree
--	autocmd BufNewFile * Neotree
--	augroup END]], false)

function autosave_last_session()
	vim.cmd "SessionSave autosave_neovim_last_session"
end

vim.api.nvim_exec([[
	augroup MiGrupo
	autocmd!
	autocmd ExitPre * lua autosave_last_session()
	augroup END]], false)
-- vim.cmd "autocmd FileWritePost * echo 'hold' "



----------VIM LSP KEYMAPS
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end})

