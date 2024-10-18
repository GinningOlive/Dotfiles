-- plugins/telescope.lua: https://github.com/nvim-telescope/telescope.nvim
return {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
-- or                              , branch = '0.1.x',
      dependencies = { 'nvim-lua/plenary.nvim' }
    }

-- reqire('telescope').load_extension("undo")
-- telescope.load_extension("undo")

-- local builtin = require('telescope.builtin')
-- vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
-- vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
-- vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
-- vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

-- vim.keymap.set('n', '<leader>ff', ':Telescope find_files <Enter>', { noremap = true })
-- vim.api.nvim_set_keymap('n', '<Leader>ff', ':lua require"telescope.builtin".find_files({ hidden = true })<CR>', {noremap = true, silent = true})
-- vim.keymap.set('n', '<leader>fg', ':Telescope live_grep <Enter>', { noremap = true })
-- vim.keymap.set('n', '<leader>fb', ':Telescope buffers <Enter>', { noremap = true })
-- vim.keymap.set('n', '<leader>fh', ':Telescope help_tags <Enter>', { noremap = true })
