return {
  "lewis6991/gitsigns.nvim",
  enabled = true,
  event = "BufReadPre",
  opts = {
    signs = {
      add = { text = "│" },
      change = { text = "│" },
      delete = { text = "_" },
      topdelete = { text = "‾" },
      changedelete = { text = "~" },
      untracked = { text = "┆" },
    },
    signs_staged_enable = true,
    numhl = false,
    linehl = false,
    update_debounce = 200,
    max_file_length = 40000,
    attach_to_untracked = false,
    watch_gitdir = {
      follow_files = true,
      interval = 1000,
    },

    -- inline virtual text: "author, time ago - summary"
    current_line_blame = true,
    current_line_blame_opts = {
      virt_text = true,
      virt_text_pos = "eol",
      delay = 300,
      ignore_whitespace = false,
    },
    current_line_blame_formatter = "  <author>, <author_time:%R> - <summary>",
  },

  keys = {
    {
      "<leader>gb",
      function()
        require("gitsigns").blame_line({ full = true })
      end,
      desc = "Blame line (full commit)",
    },
    {
      "<leader>gB",
      function()
        require("gitsigns").blame()
      end,
      desc = "Blame buffer",
    },
    {
      "<leader>ub",
      function()
        require("gitsigns").toggle_current_line_blame()
      end,
      desc = "Toggle inline blame",
    },
  },
}
