-- [[ Basic Autocommands ]]
-- See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Autoformat Lua-Dateien beim Speichern
vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*.lua',
  group = vim.api.nvim_create_augroup('lua-autoformat', { clear = true }),
  callback = function()
    local conform = require('conform')
    if conform then
      conform.format { async = true, lsp_fallback = true }
    else
      print('Conform is not available')
    end
  end,
})

-- Auto-Formatierung bei jedem Speichern for C#
vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*.cs',
  group = vim.api.nvim_create_augroup('cs-autoformat', { clear = true }),
  callback = function()
    if vim.lsp.buf.format then
      vim.lsp.buf.format()
    else
      print('LSP formatting is not available for this buffer')
    end
  end,
})

-- Prettier nur ausführen, wenn es installiert ist und der Dateityp unterstützt wird
vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = { '*.json', '*.js', '*.ts', '*.css', '*.scss', '*.md', '*.html' },
  group = vim.api.nvim_create_augroup('prettier-on-save', { clear = true }),
  callback = function()
    local is_supported = vim.tbl_contains({ 'json', 'javascript', 'typescript', 'css', 'scss', 'markdown', 'html' }, vim.bo.filetype)
    if is_supported and vim.fn.exists(':PrettierAsync') == 2 then
      vim.cmd('PrettierAsync')
    else
      print('Prettier cannot be executed for this file type')
    end
  end,
})
