return {
  ------------------disable plugins eg-------------------------
  -- disable plugins
  -- { "folke/trouble.nvim", enabled = false }
  --------------------------------------------------------------
  --
  --
  ------------Adding & Disabling Plugin Keymaps eg-------------
  -- {
  --   "nvim-telescope/telescope.nvim",
  --   keys = {
  --     -- disable the keymap to grep files
  --     { "<leader>/",  false },
  --     -- change a keymap
  --     { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
  --     -- add a keymap to browse plugin files
  --     {
  --       "<leader>fp",
  --       function() require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root }) end,
  --       desc = "Find Plugin File",
  --     },
  --   },
  -- },
  --------------------------------------------------------------
  -- -- disable plugins { "folke/trouble.nvim", enabled = false }
  { "ggandor/leap.nvim", enabled = false },
  { "theniceboy/nvim-deus" },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "deus",
    },
  },
  {
    "neovim/nvim-lspconfig",
    init = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      -- disable a keymap
      keys[#keys + 1] = { "K", false }
      -- add a keymap
      keys[#keys + 1] = { "<tab>k", vim.lsp.buf.hover, desc = "Hover" }
    end,
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    keys = {
      { "<leader>e", false },
      {
        "<A-1>",
        function()
          require("neo-tree.command").execute({ toggle = true, dir = require("lazyvim.util").get_root() })
        end,
      },
    },
    opts = {
      window = {
        position = "right",
      },
    },
  },

  {
    "folke/flash.nvim",
    event = "VeryLazy",
    vscode = true,
    opts = {},
    keys = {
      {
        "\\",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump()
        end,
        desc = "Flash",
      },
      { "S", false },
    },
  },
}
