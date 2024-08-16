return {
  "stevearc/dressing.nvim",
  event = "VeryLazy",
  config = function()
    function create_new_file()
      -- Prompt for the file path and name using Dressing.nvim
      vim.ui.input({
        prompt = "Create New File: ",
        completion = "file", -- Enable tab-completion for directories
      }, function(input)
        if input then
          -- Create directories if they don't exist
          local dir = vim.fn.fnamemodify(input, ":h")
          if dir ~= "" and not vim.fn.isdirectory(dir) then
            vim.fn.mkdir(dir, "p")
          end

          -- Open the new file in Neovim
          vim.cmd("edit " .. input)
        end
      end)
    end

    vim.api.nvim_set_keymap(
      "n",
      "<leader>nf",
      ":lua create_new_file()<CR>",
      { noremap = true, silent = true, desc = "Create new file" }
    )
  end,
}
