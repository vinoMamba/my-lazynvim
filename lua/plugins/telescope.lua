local Util = require("lazyvim.util")
return {
  "nvim-telescope/telescope.nvim",
  keys = {
    { "<leader>fo", Util.telescope("oldfiles", { cwd = vim.loop.cwd() }), desc = "Recent (cwd)" },
    { "<leader>fg", Util.telescope("live_grep"), desc = "Grep (root dir)" },
  },
}
