return {
  "sheharyarn/werewolf.nvim",
  lazy = false,
  opts = {
    system_theme = {
      on_change = function(theme)
        if theme == 'Dark' then
          vim.o.background = 'dark'
        else
          vim.o.background = 'light'
        end
      end,
    },
  },
}
