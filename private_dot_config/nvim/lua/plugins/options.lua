return {
  {
    "LazyVim/LazyVim",
    opts = function()
      vim.opt.termguicolors = true
      vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
      vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
    end,
  },
}
