return {
  {
    "rebelot/kanagawa.nvim",
    name = "kanagawa",
    priority = 1000, -- Load this before other plugins
    opts = {
      transparent = true, -- Set this to true for transparent background
      theme = "lotus",   -- Options: "wave", "dragon", "lotus"
      overrides = function(colors)
        local theme = colors.theme
        return {
          -- Fix: Make floating windows (like LSP hover) look better with transparency
          NormalFloat = { bg = "none" },
          FloatBorder = { bg = "none" },
          FloatTitle = { bg = "none" },
          -- Use the 'wave' background for the 'dragon' variant to make it a bit softer
          NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },
        }
      end,
    },
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "kanagawa",
    },
  },
}
