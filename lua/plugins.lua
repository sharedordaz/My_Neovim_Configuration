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
		desc = " Edit init.lua",
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
event = {"BufReadPre","BufNewFile"}
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
      "MunifTanjim/nui.nvim",
       "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
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
{ "EdenEast/nightfox.nvim" },
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

--FORMATTER
{ 'mhartington/formatter.nvim',
config = function()
local util = require "formatter.util"

-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
require("formatter").setup {
  -- Enable or disable logging
  logging = true,
  -- Set the log level
  log_level = vim.log.levels.WARN,
  -- All formatter configurations are opt-in
  filetype = {
    -- Formatter configurations for filetype "lua" go here
    -- and will be executed in order
    lua = {
      -- "formatter.filetypes.lua" defines default configurations for the
      -- "lua" filetype
      require("formatter.filetypes.lua").stylua,

      -- You can also define your own configuration
      function()
        -- Supports conditional formatting
        if util.get_current_buffer_file_name() == "special.lua" then
          return nil
        end

        -- Full specification of configurations is down below and in Vim help
        -- files
        return {
          exe = "stylua",
          args = {
            "--search-parent-directories",
            "--stdin-filepath",
            util.escape_path(util.get_current_buffer_file_path()),
            "--",
            "-",
          },
          stdin = true,
        }
      end
    },

    -- Use the special "*" filetype for defining formatter configurations on
    -- any filetype
    ["*"] = {
      -- "formatter.filetypes.any" defines default configurations for any
      -- filetype
      require("formatter.filetypes.any").remove_trailing_whitespace
    }
  }
}


end,
},


{'lambdalisue/suda.vim'}

}




