return {
  "ThePrimeagen/refactoring.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  ft = { "go", "javascript", "typescript", "lua", "python", "cpp", "c", "java" },
  config = function()
    require("refactoring").setup()
    require("telescope").load_extension("refactoring")

    vim.keymap.set("v", "<leader>re", function()
      require("refactoring").refactor("Extract Function")
    end, { noremap = true, silent = true })

    vim.keymap.set("v", "<leader>rf", function()
      require("refactoring").refactor("Extract Function To File")
    end, { noremap = true, silent = true })

    vim.keymap.set("v", "<leader>rv", function()
      require("refactoring").refactor("Extract Variable")
    end, { noremap = true, silent = true })

    vim.keymap.set("v", "<leader>ri", function()
      require("refactoring").refactor("Inline Variable")
    end, { noremap = true, silent = true })

    vim.keymap.set({ "n", "v" }, "<leader>rI", function()
      require("refactoring").refactor("Inline Function")
    end, { noremap = true, silent = true })

    vim.keymap.set({ "n", "v" }, "<leader>rp", function()
      require("refactoring").refactor("Extract Block to Function")
    end, { noremap = true, silent = true })

    vim.keymap.set({ "n", "v" }, "<leader>rb", function()
      require("refactoring").refactor("Extract Block")
    end, { noremap = true, silent = true })
  end,
}