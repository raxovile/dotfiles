return {
  { 'tpope/vim-fugitive' }, -- Git integration
  {
    'lewis6991/gitsigns.nvim', -- Git signs
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
  },
}
