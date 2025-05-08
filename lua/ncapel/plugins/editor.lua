return {
  {
    'nvim-lua/plenary.nvim', -- dummy dependency
    event = 'BufReadPre',
    config = function()
      -- Global fallback
      vim.o.tabstop = 4
      vim.o.shiftwidth = 4
      vim.o.softtabstop = 4
      vim.o.expandtab = true

      -- Force indent on every file open (not just FileType)
      vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWinEnter', 'FileType' }, {
        pattern = '*',
        callback = function()
          -- Uncomment to debug
          -- print("Force applying indent settings")

          vim.bo.tabstop = 4
          vim.bo.shiftwidth = 4
          vim.bo.softtabstop = 4
          vim.bo.expandtab = true
        end,
      })
    end,
  },
}
