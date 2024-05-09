return {
  {
    'nvim-lualine/lualine.nvim',
    config = function()
      require('lualine').setup {
        options = {
          theme = 'catppuccin',
          section_separators = { '', '' },
          component_separators = { '', '' },
        },
        sections = {
          lualine_a = { 'mode' },
          lualine_b = { 'branch' },
          lualine_c = { 'filename' },
          lualine_x = { 'encoding', 'fileformat', 'filetype' },
          lualine_y = { 'progress' },
          lualine_z = { 'location' },
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { 'filename' },
          lualine_x = { 'location' },
          lualine_y = {},
          lualine_z = {},
        },
        extensions = { 'fugitive', 'nvim-tree' },
      }
    end,
  },

  {
    'akinsho/bufferline.nvim',
    event = 'VeryLazy',
    keys = {
      { '<leader>bo', '<Cmd>BufferLineCloseOthers<CR>', desc = 'Delete Other Buffers' },
      { '<leader>br', '<Cmd>BufferLineCloseRight<CR>', desc = 'Delete Buffers to the Right' },
      { '<leader>bl', '<Cmd>BufferLineCloseLeft<CR>', desc = 'Delete Buffers to the Left' },
      { '[b', '<cmd>BufferLineCyclePrev<cr>', desc = 'Prev Buffer' },
      { ']b', '<cmd>BufferLineCycleNext<cr>', desc = 'Next Buffer' },
    },
    opts = {
      options = {
        -- stylua: ignore
        close_command = function(n) require("mini.bufremove").delete(n, false) end,
        -- stylua: ignore
        right_mouse_command = function(n) require("mini.bufremove").delete(n, false) end,
        diagnostics = 'nvim_lsp',
        always_show_bufferline = false,
        diagnostics_indicator = function(_, _, diag)
          local icons = require('custom.ui.icons').diagnostics
          local ret = (diag.error and icons.Error .. diag.error .. ' ' or '') .. (diag.warning and icons.Warn .. diag.warning or '')
          return vim.trim(ret)
        end,

        offsets = {
          {
            filetype = 'NvimTree',
            text = 'File Explorer',
            text_align = 'center',
          },
        },

        -- offsets = {
        --   {
        --     filetype = "neo-tree",
        --     text = "Neo-tree",
        --     highlight = "Directory",
        --     text_align = "left",
        --   },
        -- },
      },
    },
    config = function(_, opts)
      require('bufferline').setup(opts)
      -- Fix bufferline when restoring a session
      vim.api.nvim_create_autocmd('BufAdd', {
        callback = function()
          vim.schedule(function()
            pcall(nvim_bufferline)
          end)
        end,
      })
    end,
  },

  -- {
  --   'akinsho/bufferline.nvim',
  --   version = '*',
  --   dependencies = 'nvim-tree/nvim-web-devicons',
  --   keys = {
  --     { '[b', '<cmd>BufferLineCyclePrev<cr>', desc = 'Prev Buffer' },
  --     { ']b', '<cmd>BufferLineCycleNext<cr>', desc = 'Next Buffer' },
  --   },
  --   config = function()
  --     require('bufferline').setup {
  --       options = {
  --         diagnostics = 'nvim_lsp',
  --         diagnostics_indicator = function(count, level, diagnostics_dict, context)
  --           local s = ' '
  --           for e, n in pairs(diagnostics_dict) do
  --             local sym = e == 'error' and ' ' or (e == 'warning' and ' ' or '')
  --             s = s .. n .. sym
  --           end
  --           return s
  --         end,
  --         show_buffer_close_icons = true,
  --         show_close_icon = true,
  --         show_tab_indicators = true,
  --         persist_buffer_sort = true,
  --         separator_style = 'thin',
  --         always_show_bufferline = true,
  --         offsets = {
  --           {
  --             filetype = 'NvimTree',
  --             text = 'File Explorer',
  --             text_align = 'center',
  --           },
  --         },
  --       },
  --     }
  --   end,
  -- },
  { 'goolord/alpha-nvim' },
}
