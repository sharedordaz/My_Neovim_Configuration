return {
{'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  config = function()
    require('dashboard').setup {
	theme = "doom",
	config = {
		header = {"",
"",
"                           ",
" ██████   █████                  █████   █████  ███                 ",
"░░██████ ░░███                   ░░███   ░░███  ░░░                  ",
" ░███░███ ░███   █████   ██████  ░███    ░███  ████  █████████████  ",
" ░███░░███░███  ███░░███ ███░░███ ░███    ░███ ░░███ ░░███░░███░░███ ",
" ░███ ░░██████ ░███████ ░███ ░███ ░░███   ███   ░███  ░███ ░███ ░███ ",
" ░███  ░░█████ ░███░░░  ░███ ░███  ░░░█████░    ░███  ░███ ░███ ░███ ",
" █████  ░░█████░░██████ ░░██████     ░░███      █████ █████░███ █████",
"░░░░░    ░░░░░  ░░░░░░   ░░░░░░       ░░░      ░░░░░ ░░░░░ ░░░ ░░░░░ ",
"―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――",
"",
""		},

center = {

	{
		icon = "◉",
		desc =  "Go to Last Session",
		desc_hl = "String",
		action = "SessionLoad autosave_neovim_last_session",
                },
	{
		icon = "◉",
		desc = "Edit init.lua",
		desc_hl = "String",
		action = "edit $MYVIMRC"
	},
	{
		icon = "◉",
		desc = "Edit plugins.lua",
		desc_hl = "String",
		action = "execute 'edit' g:plugPATH"
	}
	}

}
}

  end,
  dependencies = { {'nvim-tree/nvim-web-devicons'}},
},
--LSP SERVERS, MASON
{"williamboman/mason.nvim",
config = function()
require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

end,
},

{"williamboman/mason-lspconfig.nvim",
config = function()
	require("mason-lspconfig").setup({
	ensure_installed = {
	"lua_ls"
	},
	handlers = {
	function(ls) require("lspconfig")[ls].setup({})
	end
	}
})
end,

},
{"neovim/nvim-lspconfig",
event = {"BufReadPre","BufNewFile"},

config = function()
    require ("lspconfig").emmet_language_server.setup(
    require("plugin-configs.emmet_ls"))
end,

},
{"hrsh7th/nvim-cmp",
  version = false, -- last release is way too old
  event = "InsertEnter",
  config = require("plugin-configs.cmp").cmpsetup,
  dependencies = {
    "saadparwaiz1/cmp_luasnip",
    {"L3MON4D3/LuaSnip", build = "make install_jsregexp"},

    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-cmdline",
    },

},

{
  "olrtg/nvim-emmet",
  config = function()
    vim.keymap.set({ "n", "v" }, '<leader>xe', require('nvim-emmet').wrap_with_abbreviation)
  end,
},

--DBSESSION
    {'glepnir/dbsession.nvim',
    cmd = { 'SessionSave', 'SessionDelete', 'SessionLoad'},
      opts = {  --config --
	      }},

--NEOTREE
{
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",    {
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
-- or                              , branch = '0.1.x',
      dependencies = { 'nvim-lua/plenary.nvim' }
    } 
    }
},
--LUALINE
{
  'nvim-lualine/lualine.nvim',
  config = function()
   require("lualine").setup{
	   options = { theme = "papercolor_dark"}

   }
  end,
  dependencies = { 'nvim-tree/nvim-web-devicons'}
},
--THEMES
--{ "EdenEast/nightfox.nvim" },
{"ku1ik/vim-monokai"},
{"NLKNguyen/papercolor-theme"},

--BARBAR (BUFFERS)
{'romgrk/barbar.nvim',
    dependencies = {
      'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
      'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    },
    init = function() vim.g.barbar_auto_setup = false end,
    opts = {
      -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
      -- animation = true,
      -- insert_at_start = true,
      -- …etc.
    },
    version = '^1.0.0', -- optional: only update when a new 1.x version is released
  },

--COPILOT (IS NOT FREE!)
--[[{"zbirenbaum/copilot.lua",
config = function()
require("copilot").setup({})
end,
},--]]

--SURROUND
{
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
        require("nvim-surround").setup({
            -- Configuration here, or leave empty to use defaults
        })
    end
},
--MINI COMPLETITION
{ 'echasnovski/mini.nvim', version = false,
config = function()
require("mini.completion").setup()
end,

},

--
{"folke/noice.nvim",
    event= "VeryLazy",
    opts={
    },
    dependencies={
        "MunifTanjim/nui.nvim",
    -- OPTIONAL:
    --   `nvim-notify` is only needed, if you want to use the notification view.
    --   If not available, we use `mini` as the fallback
    "rcarriga/nvim-notify",
    },
    config = function()
    require("noice").setup(require("plugin-configs.noice")
    )
end
},

{'sbdchd/neoformat'},

--SUDA.vim
{'lambdalisue/suda.vim'},

--illuminate
--{"RRethy/vim-illuminate"},
{'anhpt379/nvim-cursorword'},

{
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
-- or                              , branch = '0.1.x',
      dependencies = { 'nvim-lua/plenary.nvim' }
},

{ 'm00qek/baleia.nvim'},

{
    'https://github.com/adelarsq/image_preview.nvim',
    event = 'VeryLazy',
    config = function()
        require("image_preview").setup()
    end
},

--Which key

{
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  opts = {
    mode = 'n',
  }
},
--------COLORTILS, to see HEX COLORS AND RGB---
{ "max397574/colortils.nvim",
  cmd = "Colortils",
  config = function()
    require("colortils").setup(require('plugin-configs.colortils'))
  end,},
{ 'norcalli/nvim-colorizer.lua',
    config = function()
        local myconf = require('plugin-configs.colorizer')
        require('colorizer').setup(myconf.css, myconf.general_config)
    end,
},

-----CHAFA TO SEE IMAGES
{
  "princejoogie/chafa.nvim",
  requires = {
    "nvim-lua/plenary.nvim",
    "m00qek/baleia.nvim"
  },

  config = function()
    require("chafa").setup({
    render = {
    min_padding = 5,
    show_label = true,
    },
    events = {
    update_on_nvim_resize = false,
    },
})
end,
},

--[[{
  "jackMort/ChatGPT.nvim",
    event = "VeryLazy",
    config = function()
      require("chatgpt").setup(require('plugin-configs.chatgpt'))
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "folke/trouble.nvim",
      "nvim-telescope/telescope.nvim"
    }
}--]]
-- Comment.nvim: gcc to comment
{
    'numToStr/Comment.nvim',
    opts = {
            },
    config = function()
        require('Comment').setup()
    end,
    lazy = false,
},
--Indent Blank Line
{ "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },

--Live Server
{
        'barrett-ruth/live-server.nvim',
        config = function()
            require('live-server').setup()
        end
},

--Read Office Files
{
    'https://gitlab.com/Syndamia/texty-office.vim'
}




}
