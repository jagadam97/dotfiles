return {
  "ojroques/nvim-osc52",
  config = function()
    require('osc52').setup({
      silent = false,      -- Display a message on successful copy
      trim = false,        -- Don't trim surrounding whitespace
      tmux_passthrough = true, -- REQUIRED if you use tmux
    })

    -- Optional: Use OSC 52 as the default clipboard provider
    local function copy(lines, _)
      require('osc52').copy(table.concat(lines, '\n'))
    end

    local function paste()
      return {vim.fn.split(vim.fn.getreg(''), '\n'), vim.fn.getregtype('')}
    end

    vim.g.clipboard = {
      name = 'osc52',
      copy = {['+'] = copy, ['*'] = copy},
      paste = {['+'] = paste, ['*'] = paste},
    }
  end
}
