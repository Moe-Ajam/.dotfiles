-- Create this file as lua/config/plugins/nvim-java.lua
return {
  {
    'nvim-java/nvim-java',
    dependencies = {
      'nvim-java/lua-async-await',
      'nvim-java/nvim-java-core',
      'nvim-java/nvim-java-test',
      'nvim-java/nvim-java-dap',
      'MunifTanjim/nui.nvim',
      'neovim/nvim-lspconfig',
      'mfussenegger/nvim-dap',
      'williamboman/mason.nvim',
      'hrsh7th/nvim-cmp',
    },
    ft = { 'java' },
    config = function()
      -- Setup nvim-java BEFORE lspconfig
      require('java').setup({
        root_markers = {
          'settings.gradle',
          'settings.gradle.kts',
          'pom.xml',
          'build.gradle',
          'mvnw',
          'gradlew',
          'build.xml',
          '.git',
        },
        workspace = vim.fn.expand('~/.cache/jdtls/workspace'),
        notifications = {
          dap = true,
        },
        verification = {
          invalid_order = true,
          duplicate_setup_calls = true,
        }
      })

      -- Java-specific keymaps (will be available when Java files are loaded)
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "java",
        callback = function()
          local opts = { buffer = true, silent = true }
          
          -- Java specific keymaps
          vim.keymap.set('n', '<leader>jo', "<cmd>lua require('java').organize_imports()<cr>", 
            vim.tbl_extend('force', opts, { desc = "Organize imports" }))
          vim.keymap.set('n', '<leader>jt', "<cmd>lua require('java').test.run_current_class()<cr>", 
            vim.tbl_extend('force', opts, { desc = "Run test class" }))
          vim.keymap.set('n', '<leader>jT', "<cmd>lua require('java').test.run_current_method()<cr>", 
            vim.tbl_extend('force', opts, { desc = "Run test method" }))
          vim.keymap.set('n', '<leader>jd', "<cmd>lua require('java').test.debug_current_class()<cr>", 
            vim.tbl_extend('force', opts, { desc = "Debug test class" }))
          vim.keymap.set('n', '<leader>jD', "<cmd>lua require('java').test.debug_current_method()<cr>", 
            vim.tbl_extend('force', opts, { desc = "Debug test method" }))
          vim.keymap.set('n', '<leader>jc', "<cmd>lua require('java').compile.full()<cr>", 
            vim.tbl_extend('force', opts, { desc = "Compile project" }))
          vim.keymap.set('n', '<leader>jr', "<cmd>lua require('java').runner.built_in.run_app()<cr>", 
            vim.tbl_extend('force', opts, { desc = "Run application" }))
        end,
      })
    end,
  }
}
