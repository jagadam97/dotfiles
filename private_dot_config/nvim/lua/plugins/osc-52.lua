return {
  "ojroques/nvim-osc52",
  event = "VeryLazy",
  config = function()
    local osc52 = require('osc52')

    osc52.setup({
      max_length = 0,
      silent = false,
      trim = false,
      tmux_passthrough = false,
    })

    -- Use autocmd to catch ALL yanks
    vim.api.nvim_create_autocmd('TextYankPost', {
      callback = function()
        if vim.v.event.operator == 'y' then
          local content = vim.fn.getreg('"')
          if content and content ~= '' then
            osc52.copy(content)
          end
        end
      end
    })
  end
}
