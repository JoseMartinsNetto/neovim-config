vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>de', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- MyKeyMaps
vim.keymap.set('i', 'jk', '<ESC>', { desc = 'Escape insert mode' })
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move selected lines up' })
vim.keymap.set('v', 'K', ":m '>-2<CR>gv=gv", { desc = 'Move selected lines down' })

vim.keymap.set('n', '<leader>fm', function()
  require('conform').format()
end, { desc = 'File Format with conform' })

vim.keymap.set('n', '<leader>x', function()
  local bd = require('mini.bufremove').delete
  if vim.bo.modified then
    local choice = vim.fn.confirm(('Save changes to %q?'):format(vim.fn.bufname()), '&Yes\n&No\n&Cancel')
    if choice == 1 then -- Yes
      vim.cmd.write()
      bd(0)
    elseif choice == 2 then -- No
      bd(0, true)
    end
  else
    bd(0)
  end
end, { desc = 'Delete buffer' })

vim.keymap.set('n', '<leader>g', '<cmd>LazyGit<CR>', { desc = 'Open LazyGit' })

vim.keymap.set('n', '<leader>e', '<cmd>NvimTreeToggle<CR>', { desc = 'Toggle file explorer' })

vim.keymap.set('n', '<leader>tr', function()
  require('neotest').run.run()
  require('neotest').summary.open()
end, { desc = 'Neotest Run nearest test' })

vim.keymap.set('n', '<leader>tra', function()
  require('neotest').run.run(vim.fn.expand '%')
  require('neotest').summary.open()
end, { desc = 'Neotest Run all tests in file' })

vim.keymap.set('n', '<leader>tso', function()
  require('neotest').summary.open()
end, { desc = 'Neotest open summary' })

vim.keymap.set('n', '<leader>tsc', function()
  require('neotest').summary.close()
end, { desc = 'Neotest close summary' })

vim.keymap.set('n', '<leader>tst', function()
  require('neotest').summary.toggle()
end, { desc = 'Neotest toggle summary' })

vim.keymap.set('n', '<leader>tf', function()
  local cwd = vim.uv.cwd()

  vim.cmd('ToggleTerm size=40 dir=' .. cwd .. ' direction=float name=desktop')
end, { desc = 'Toggle terminal float' })
