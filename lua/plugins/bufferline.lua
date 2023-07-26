return {
  "akinsho/bufferline.nvim",
  event = "VeryLazy",
  keys = {
    { "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", desc = "Toggle pin" },
    { "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete non-pinned buffers" },
    { "<leader>bo", "<Cmd>BufferLineCloseOthers<CR>", desc = "Close others" },
  },
  opts = {
    options = {
      show_buffer_close_icons = false,
      show_close_icon = false,
      enforce_regular_tabs = true,
      show_duplicate_prefix = false,
      indicator = {
        icon = "▎", -- this should be omitted if indicator style is not 'icon'
        -- style = 'icon' | 'underline' | 'none',
        style = "underline",
      },
      diagnostics = "nvim_lsp",
      always_show_bufferline = true,
      diagnostics_indicator = function(_, _, diag)
        local icons = require("lazyvim.config").icons.diagnostics
        local ret = (diag.error and icons.Error .. diag.error .. " " or "")
          .. (diag.warning and icons.Warn .. diag.warning or "")
        return vim.trim(ret)
      end,
      offsets = {
        {
          filetype = "neo-tree",
          text = "Neo-tree",
          highlight = "Directory",
          text_align = "left",
        },
      },
      hover = {
        enabled = false,
      },
    },
  },
}
