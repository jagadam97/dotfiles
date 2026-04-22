return {
  "nvim-treesitter/nvim-treesitter-context",
  dependencies = "nvim-treesitter/nvim-treesitter",
  config = function()
    require("treesitter-context").setup({
      enable = true,
      max_lines = 3,
      trim_scope = "outer",
      patterns = {
        default = {
          "class",
          "function",
          "method",
          "for",
          "while",
          "if",
          "switch",
          "case",
          "interface",
          "struct",
          "impl",
          "trait",
          "module",
        },
      },
      expand_aliases = {},
      zindex = 20,
    })
  end,
}