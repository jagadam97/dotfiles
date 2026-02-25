return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      hls = {
        settings = {
          haskell = {
            hlintOn = true,
          },
        },
      },
    },
  },
}
