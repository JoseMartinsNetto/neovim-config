return {
  { 'nvim-neotest/nvim-nio' },
  { 'sidlatau/neotest-dart' },
  {
    'nvim-neotest/neotest',
    dependecies = {
      'sidlatau/neotest-dart',
    },
    config = function()
      require('neotest').setup {
        adapters = {
          require 'neotest-dart' {
            command = 'flutter', -- Command being used to run tests. Defaults to `flutter`
            use_lsp = true, -- When set Flutter outline information is used when constructing test name.
          },
        },
      }
    end,
  },
}
