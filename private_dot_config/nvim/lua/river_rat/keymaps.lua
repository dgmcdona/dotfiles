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
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = '[R]e[n]ame' })
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = '[C]ode [A]ction' })

-- See `:help K` for why this keymap
vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = 'Hover Documentation' })
vim.keymap.set('n', '<C-s>', vim.lsp.buf.signature_help, { desc = 'Signature Documentation' })

-- Lesser used LSP functionality
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { desc = '[G]oto [D]eclaration'})
vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, { desc = '[W]orkspace [A]dd Folder'})
vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, { desc = '[W]orkspace [R]emove Folder'})
vim.keymap.set('n', '<leader>wl', function()
  print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end, { desc = '[W]orkspace [L]ist Folders'})

-- LazyGit mappings
vim.keymap.set("n", "<leader>gg", function()
  vim.cmd([[:LazyGit]])
end, { desc = "[G]o to [G]it" })
--
-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

