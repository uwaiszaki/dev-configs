return {
  {
    "telescope.nvim",
    dependencies = {
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
      },
      "nvim-telescope/telescope-file-browser.nvim",
      "nvim-telescope/telescope-project.nvim",
    },
    keys = {
      {
        "<leader>fP",
        function()
          require("telescope.builtin").find_files({
            cwd = require("lazy.core.config").options.root,
          })
        end,
        desc = "Find Plugin File",
      },
      {
        "\\f",
        function()
          local builtin = require("telescope.builtin")
          builtin.find_files({
            no_ignore = false,
            hidden = true,
          })
        end,
        desc = "Lists files in your current working directory, respects .gitignore",
      },
      {
        "\\r",
        function()
          local builtin = require("telescope.builtin")
          builtin.live_grep()
        end,
        desc = "Search for a string in your current working directory and get results live as you type, respects .gitignore",
      },
      {
        "\\\\",
        function()
          local builtin = require("telescope.builtin")
          builtin.buffers()
        end,
        desc = "Lists open buffers",
      },
      {
        "\\q",
        function()
          vim.cmd("bd")
        end,
        desc = "Quit the current buffer",
      },
      {
        "\\c",
        function()
          vim.cmd(":hide")
        end,
        desc = "Closes the current buffer",
      },
      {
        "\\t",
        function()
          local builtin = require("telescope.builtin")
          builtin.help_tags()
        end,
        desc = "Lists available help tags and opens a new window with the relevant help info on <cr>",
      },
      {
        "\\l",
        function()
          local builtin = require("telescope.builtin")
          builtin.resume()
        end,
        desc = "Resume the previous telescope picker",
      },
      {
        "\\e",
        function()
          local builtin = require("telescope.builtin")
          builtin.diagnostics()
        end,
        desc = "Lists Diagnostics for all open buffers or a specific buffer",
      },
      {
        "\\s",
        function()
          local builtin = require("telescope.builtin")
          builtin.treesitter()
        end,
        desc = "Lists Function names, variables, from Treesitter",
      },
      {
        "sf",
        function()
          local telescope = require("telescope")

          local function telescope_buffer_dir()
            return vim.fn.expand("%:p:h")
          end

          telescope.extensions.file_browser.file_browser({
            path = "%:p:h",
            cwd = telescope_buffer_dir(),
            respect_gitignore = false,
            hidden = true,
            grouped = true,
            previewer = false,
            initial_mode = "normal",
            layout_config = { height = 40 },
          })
        end,
        desc = "Open File Browser with the path of the current buffer",
      },
    },
    config = function(_, opts)
      local telescope = require("telescope")
      local actions = require("telescope.actions")
      local action_state = require("telescope.actions.state")

      local fb_actions = require("telescope").extensions.file_browser.actions

      opts.defaults = vim.tbl_deep_extend("force", opts.defaults, {
        wrap_results = true,
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        winblend = 0,
        mappings = {
          n = {},
        },
      })
      opts.pickers = {
        diagnostics = {
          theme = "ivy",
          initial_mode = "normal",
          layout_config = {
            preview_cutoff = 9999,
          },
        },
      }
      opts.extensions = {
        file_browser = {
          theme = "dropdown",
          -- disables netrw and use telescope-file-browser in its place
          hijack_netrw = true,
          mappings = {
            -- your custom insert mode mappings
            -- ["i"] = {
            --   -- Your other insert mode mappings...
            --
            --   -- Open file in a horizontal split
            --   ["<C-_>"] = function(prompt_bufnr)
            --     local selection = require("telescope.actions.state").get_selected_entry(prompt_bufnr)
            --     local filename = selection.value
            --     require("telescope.actions").close(prompt_bufnr)
            --     vim.cmd("split " .. filename)
            --   end,
            --
            -- },
            ["n"] = {
              -- your custom normal mode mappings
              ["N"] = fb_actions.create,
              ["H"] = fb_actions.goto_home_dir,
              ["P"] = fb_actions.goto_parent_dir,
              ["C"] = fb_actions.goto_cwd,
              ["T"] = function(prompt_bufnr)
                local selection = action_state.get_selected_entry()
                actions.close(prompt_bufnr)
                vim.cmd("tabnew" .. selection.value)
              end,
              ["/"] = function()
                vim.cmd("startinsert")
              end,

              -- Open file in a vertical split
              ["V"] = function(prompt_bufnr)
                local selection = action_state.get_selected_entry()
                actions.close(prompt_bufnr)
                local filename = selection.value
                vim.cmd("vsplit " .. filename)
              end,
              -- Open file in a horizontal split
              ["S"] = function(prompt_bufnr)
                local selection = action_state.get_selected_entry()
                actions.close(prompt_bufnr)
                local filename = selection.value
                vim.cmd("split " .. filename)
              end,

              -- ["<A-b"] = function(prompt_bufnr)
              --   for i = 1, 20 do
              --     actions.move_selection_previous(prompt_bufnr)
              --   end
              -- end,
              -- ["<A-f>"] = function(prompt_bufnr)
              --   for i = 1, 20 do
              --     actions.move_selection_next(prompt_bufnr)
              --   end
              -- end,
              -- ["<C-k>"] = function(prompt_bufnr)
              --   for i = 1, 10 do
              --     actions.move_selection_previous(prompt_bufnr)
              --   end
              -- end,
              -- ["<C-j>"] = function(prompt_bufnr)
              --   for i = 1, 10 do
              --     actions.move_selection_next(prompt_bufnr)
              --   end
              -- end,
              -- ["<A-u"] = actions.preview_scrolling_up,
              -- ["<A-d>"] = actions.preview_scrolling_down,
            },
          },
        },
      }
      telescope.setup(opts)
      require("telescope").load_extension("fzf")
      require("telescope").load_extension("file_browser")
    end,
  },
}
