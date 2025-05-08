return {
  {
    'nvimtools/none-ls.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local null_ls = require 'null-ls'
      null_ls.setup {
        sources = {
          -- Prettier for JS/TS/etc.
          null_ls.builtins.formatting.prettier.with {
            extra_args = { '--config', vim.fn.expand '~/.config/prettier/.prettierrc' },
          },

          -- Goimports for Go
          null_ls.builtins.formatting.goimports.with {
            command = vim.fn.stdpath 'data' .. '/mason/bin/goimports', -- explicitly use Mason's version
          },
        },

        -- Format on save
        on_attach = function(client, bufnr)
          if client.supports_method 'textDocument/formatting' then
            vim.api.nvim_create_autocmd('BufWritePre', {
              buffer = bufnr,
              callback = function()
                vim.lsp.buf.format { bufnr = bufnr }
              end,
            })
          end
        end,
      }
    end,
  },
}
