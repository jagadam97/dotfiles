-- in your plugins.lua or lazyvim custom config
return {
  {
    "ojroques/nvim-osc52",
    config = function()
      require("osc52").setup({
        max_length = 0, -- 0 = unlimited, can also set e.g. 100000
        trim = true,
      })

      -- optional: auto yank to local clipboard
      vim.cmd([[autocmd TextYankPost * lua require('osc52').copy_register('"')]])
    end,
  },
}
