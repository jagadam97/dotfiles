return {
  "stevearc/aerial.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("aerial").setup({
      backends = { "treesitter", "lsp" },
      layout = {
        default = { width = 0.3 },
      },
      icons = {
        KindSymbol = " ",
      },
    })

    vim.keymap.set("n", "<leader>a", "<cmd>AerialToggle<CR>", { noremap = true, silent = true })
  end,
}