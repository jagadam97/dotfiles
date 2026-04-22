return {
  "rcarriga/nvim-notify",
  event = "VeryLazy",
  config = function()
    local notify = require("notify")
    notify.setup({
      stages = "fade",
      timeout = 3000,
      max_width = 50,
      background_colour = "#1a1a2e",
    })
    vim.notify = notify.setup({})
  end,
}