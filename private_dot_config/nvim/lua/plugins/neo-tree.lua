return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("neo-tree").setup({
        close_if_last_window = true,
        popup_border_style = "rounded",
        enable_git_status = true,
        enable_diagnostics = true,
        window = { position = "left", width = 25 },
        default_component_configs = {
          icon = {
            folder_closed = "",
            folder_open = "",
            folder_empty = "ﰊ",
            folder_empty_open = "ﰊ",
            default = "*",
            use_filtered_colors = true,
          },
        },
      })

      -- keymap to toggle Neo-tree
      vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>", { noremap = true, silent = true })

      -- auto-open on Vim startup
      vim.api.nvim_create_autocmd("VimEnter", {
        callback = function()
          vim.cmd("Neotree show")
        end,
      })
    end,
  },
}
