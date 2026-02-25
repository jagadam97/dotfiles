return {
  "ojroques/nvim-osc52",
  config = function()
    local osc52 = require('osc52')

    osc52.setup({
      silent = false,           -- Display a message on successful copy
      trim = false,             -- Don't trim surrounding whitespace
      tmux_passthrough = true,  -- REQUIRED if you use tmux
    })

    -- Define the copy function using the plugin
    local function copy(lines, _)
      osc52.copy(table.concat(lines, '\n'))
    end

    -- Define a dummy paste function 
    -- (Note: Most terminals block remote-to-local pasting for security)
    local function paste()
      return {vim.fn.split(vim.fn.getreg(''), '\n'), vim.fn.getregtype('')}
    end

    -- Sync Neovim's clipboard with the OSC52 provider
    vim.g.clipboard = {
      name = 'osc52',
      copy = {
        ['+'] = copy,
        ['*'] = copy,
      },
      paste = {
        ['+'] = paste,
        ['*'] = paste,
      },
    }

    -- THIS IS THE KEY: This makes 'y' use the '+' register automatically
    vim.opt.clipboard = "unnamedplus"
  end
}
