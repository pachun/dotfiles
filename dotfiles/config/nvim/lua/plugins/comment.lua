return {
  "numToStr/Comment.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "JoosepAlviste/nvim-ts-context-commentstring",
  },
  config = function()
    -- import comment plugin safely
    local comment = require("Comment")

    local ts_context_commentstring = require("ts_context_commentstring.integrations.comment_nvim")

    -- enable comment
    comment.setup({
      -- for commenting tsx, jsx, svelte, html files
      pre_hook = ts_context_commentstring.create_pre_hook(),
    })

    -- coming from tcomment, I'm used to these mappings
    vim.api.nvim_set_keymap(
      "n",
      "<c-_><c-_>",
      ":lua require('Comment.api').toggle.linewise.current()<CR>",
      { noremap = true, silent = true }
    )

    vim.api.nvim_set_keymap(
      "v",
      "<c-_><c-_>",
      "<Plug>(comment_toggle_linewise_visual)",
      { noremap = true, silent = true }
    )
  end,
}
