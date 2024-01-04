return {
  "akinsho/toggleterm.nvim",
  version = "*",
  opts = {
    size = function(term)
      if term.direction == "horizontal" then
        return 20
      elseif term.direction == "vertical" then
        return vim.o.columns * 0.4
      end
      return 20
    end,
    open_mapping = [[<c-\>]], -- Key mapping to open the terminal
    hide_numbers = true, -- Hide the number line in the terminal
    shade_filetypes = {},
    shade_terminals = true,
    shading_factor = -80,
    start_in_insert = true,
    insert_mappings = true,
    persist_size = true,
    direction = "float", -- or 'horizontal'/'vertical'
    close_on_exit = true,
    shell = "/bin/zsh", -- Change the default shell
  },
}
