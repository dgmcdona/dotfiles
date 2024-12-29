-- [[ Basic Keymaps ]]

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set('n', 'H', function() vim.cmd([[:bprevious]]) end , { silent = true })
vim.keymap.set('n', 'L', function() vim.cmd([[:bnext]]) end , { silent = true })
vim.keymap.set('n', '<leader>gn', function() vim.cmd([[:cn]]) end , { silent = true })
vim.keymap.set('n', '<leader>gp', function() vim.cmd([[:cp]]) end , { silent = true })
vim.keymap.set('n', 'n', 'nzz')
vim.keymap.set('n', 'N', 'Nzz')
vim.keymap.set('n', '<leader>h', function() vim.cmd([[:noh]]) end , { silent = true })
vim.keymap.set('n', '<C-k>', function() vim.cmd([[:res +5]]) end, { silent = true })
vim.keymap.set('n', '<C-j>', function() vim.cmd([[:res -5]]) end, { silent = true })
vim.keymap.set('n', '<C-h>', '<C-w><', { silent = true })
vim.keymap.set('n', '<C-l>', '<C-w>>', { silent = true })
vim.keymap.set('n', '[q', function() pcall(vim.cmd([[:cp]])) end, { silent = true })
vim.keymap.set('n', ']q', function() pcall(vim.cmd([[:cn]])) end, { silent = true })
vim.keymap.set('n', '<leader>dh', function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled()) end, { silent = true })
