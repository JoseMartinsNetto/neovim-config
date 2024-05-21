local map = function(mode, lhs, rhs, description)
  vim.keymap.set(mode, lhs, rhs, { desc = description })
end

map('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
map('n', '[d', vim.diagnostic.goto_prev, 'Go to previous [D]iagnostic message')
map('n', ']d', vim.diagnostic.goto_next, 'Go to next [D]iagnostic message')
map('n', '<leader>de', vim.diagnostic.open_float, 'Show diagnostic [E]rror messages')
map('n', '<leader>q', vim.diagnostic.setloclist, 'Open diagnostic [Q]uickfix list')

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
map('t', '<Esc><Esc>', '<C-\\><C-n>', 'Exit terminal mode')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
map('n', '<C-h>', '<C-w><C-h>', 'Move focus to the left window')
map('n', '<C-l>', '<C-w><C-l>', 'Move focus to the right window')
map('n', '<C-j>', '<C-w><C-j>', 'Move focus to the lower window')
map('n', '<C-k>', '<C-w><C-k>', 'Move focus to the upper window')

-- MyKeyMaps
map('i', 'jk', '<ESC>', 'Escape insert mode')
map('v', 'J', ":m '>+1<CR>gv=gv", 'Move selected lines up')
map('v', 'K', ":m '>-2<CR>gv=gv", 'Move selected lines down')

map('n', '<leader>cf', function()
  require('conform').format()
end, 'LSP: [F]ile [F]ormat')

map('n', '<leader>x', function()
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
end, 'Delete buffer')

map('n', '<leader>gg', '<cmd>LazyGit<CR>', 'Open LazyGit')

map('n', '<leader>e', '<cmd>NvimTreeToggle<CR>', 'Toggle file explorer')

map('n', '<leader>tr', function()
  local neotest = require 'neotest'

  neotest.run.run()
  neotest.summary.open()
end, 'Neotest Run nearest test')

map('n', '<leader>tra', function()
  local neotest = require 'neotest'

  neotest.run.run(vim.fn.expand '%')
  neotest.summary.open()
end, 'Neotest Run all tests in file')

map('n', '<leader>tso', function()
  require('neotest').summary.open()
end, 'Neotest open summary')

map('n', '<leader>tsc', function()
  require('neotest').summary.close()
end, 'Neotest close summary')

map('n', '<leader>tst', function()
  require('neotest').summary.toggle()
end, 'Neotest toggle summary')

map('n', '<leader>tf', function()
  local cwd = vim.uv.cwd()

  vim.cmd('ToggleTerm size=40 dir=' .. cwd .. ' direction=float name=desktop')
end, 'Toggle terminal float')
