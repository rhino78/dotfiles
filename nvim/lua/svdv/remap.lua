vim.g.mapleader = " "
-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- Experimental
vim.keymap.set('n' , '<leader>rn', vim.lsp.buf.rename, { desc ='[R]e[n]ame'})
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {desc = '[C]ode [A]ction'})
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = '[G]oto [D]efinition'})
vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, {desc = '[G]oto [R]eferences'})
vim.keymap.set('n', 'gI', vim.lsp.buf.implementation, {desc = '[G]oto [I]mplementation'})
vim.keymap.set('n','<leader>D', vim.lsp.buf.type_definition, {desc = 'Type [D]efinition'})
vim.keymap.set('n','<leader>ds', require('telescope.builtin').lsp_document_symbols, {desc = '[D]ocument [S]ymbols'})
vim.keymap.set('n','<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, {desc = '[W]orkspace [S]ymbols'})
-- -- See `:help K` for why this keymap
vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = 'Hover Documentation'})
vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, { desc = 'Signature Documentation'})


vim.keymap.set("n", "<leader>vv", ":NvimTreeToggle<CR>", { silent = true })
vim.keymap.set("n", "<leader>ps", ":PackerSync<CR>", { silent = true })
vim.keymap.set("n", "<leader>t", ":ToggleTerm size=40 direction=horizontal<CR>")
vim.keymap.set("n", "<leader>w", ":w!<CR>")
vim.keymap.set("n", "<leader>sy", ":SymbolsOutline<CR>")
vim.keymap.set("n", "<leader>vm", ":VimwikiToggleListItem<CR>")
vim.keymap.set("i", "jk", "<Esc>")

-- Move selected lines in visual mode up or down, awesome!
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Tabline
vim.keymap.set("n", "<A-n>", ":TablineBufferNext<CR>", { silent = true })
vim.keymap.set("n", "<A-m>", ":TablineBufferPrevious<CR>", { silent = true })

-- Window hopping wit Alt
vim.keymap.set("n", "<A-h>", "<C-w>h<CR>")
vim.keymap.set("n", "<A-j>", "<C-w>j<CR>")
vim.keymap.set("n", "<A-k>", "<C-w>k<CR>")
vim.keymap.set("n", "<A-l>", "<C-w>l<CR>")

-- close leader
vim.keymap.set("n", "<leader>c", ":bd<CR>")

-- Open horizontal terminal
--vim.keymap.set("n", "<leader>th", ":below 18 sp<CR>:term<CR>i", { silent = true })
--vim.keymap.set("t", "<leader>tc", "exit<CR>", { silent = true })

vim.keymap.set("n", "<leader>cn", ":below 18 sp<CR>:term<CR>ig++ std=c++2a -o ", { silent = true })
vim.keymap.set("n", "<leader>cp", ":below 18 sp<CR>:term<CR>ig++ -o ", { silent = true })

-- Color picker
vim.keymap.set("n", "<C-c>", "<cmd>PickColor<cr>", { silent = true })
vim.keymap.set("i", "<C-c>", "<cmd>PickColorInsert<cr>", { silent = true })

vim.keymap.set("n", "Y", "yg$")
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Colorizer attach to leader
vim.keymap.set("n", "<leader>sc", ":ColorizerAttachToBuffer<CR>", { silent = true })
-- Colorizer detach from leader
vim.keymap.set("n", "<leader>hc", ":ColorizerDetachFromBuffer<CR>", { silent = true })

-- Paste from clipboard
vim.keymap.set("x", "<leader>p", "\"+p")
vim.keymap.set("n", "<leader>p", "\"+p")

-- Yank from clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

vim.keymap.set("v", "<leader>d", "\"_d")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", function()
	vim.lsp.buf.format()
end)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })



-- {{{ NOTE TAKING

-- }}}
