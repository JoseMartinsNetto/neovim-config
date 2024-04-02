return {
  {
    'nvim-lualine/lualine.nvim',
    config = function()
      require('lualine').setup {
        options = {
          theme = 'gruvbox',
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
    version = '*',
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      require('bufferline').setup {
        options = {
          diagnostics = 'nvim_lsp',
          diagnostics_indicator = function(count, level, diagnostics_dict, context)
            local s = ' '
            for e, n in pairs(diagnostics_dict) do
              local sym = e == 'error' and ' ' or (e == 'warning' and ' ' or '')
              s = s .. n .. sym
            end
            return s
          end,
          show_buffer_close_icons = false,
          show_close_icon = false,
          show_tab_indicators = true,
          persist_buffer_sort = true,
          separator_style = 'thin',
          always_show_bufferline = false,
          offsets = {
            {
              filetype = 'NvimTree',
              text = 'File Explorer',
              text_align = 'center',
            },
          },
        },
      }
    end,
  },
  { 'goolord/alpha-nvim', enabled = true },
  -- -- {
  -- --   'lukas-reineke/indent-blankline.nvim',
  -- --   opts = function(_, opts)
  -- --     opts.filetype_exclude = vim.tbl_extend('force', opts.filetype_exclude, { 'nvdash', 'nvcheatsheet' })
  -- --   end,
  -- -- },
  -- {
  --   'echasnovski/mini.indentscope',
  --   init = function()
  --     vim.api.nvim_create_autocmd('FileType', {
  --       pattern = { 'help', 'alpha', 'dashboard', 'neo-tree', 'Trouble', 'lazy', 'mason', 'nvdash', 'nvcheatsheet' },
  --       callback = function()
  --         vim.b.miniindentscope_disable = true
  --       end,
  --     })
  --   end,
  -- },
  -- {
  --   'kingavatar/nvchad-ui.nvim',
  --   branch = 'v2.0',
  --   lazy = false,
  --   config = function()
  --     require('nvchad_ui').setup {
  --       lazyVim = true,
  --       statusline = { separator_style = 'default', theme = 'default', lualine = true },
  --       theme_toggle = { 'tokyonight', 'rose-pine' },
  --       nvdash = { load_on_startup = true },
  --     }
  --
  --     -- rename nvchad
  --     vim.keymap.set('n', '<leader>cn', require('nvchad_ui.renamer').open, { desc = 'nvchad Rename' })
  --   end,
  -- },
}
