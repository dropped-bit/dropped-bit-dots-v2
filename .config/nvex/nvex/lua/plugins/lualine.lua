return {
  "nvim-lualine/lualine.nvim",
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  event = "VeryLazy",
  init = function()
    vim.g.lualine_laststatus = vim.o.laststatus
    if vim.fn.argc(-1) > 0 then
      -- set an empty statusline till lualine loads
      vim.o.statusline = " "
    else
      -- hide the statusline on the starter page
      vim.o.laststatus = 0
    end
  end,
  -- setup = function()
  config = function()
    local lualine = require("lualine")
    local lazy_status = require("lazy.status") -- to configure lazy pending updates count
    local trouble = require("trouble")
    local symbols = trouble.statusline({
      mode = "symbols",
      groups = {},
      title = false,
      filter = { range = true },
      format = "{kind_icon}{symbol.name:Normal}",
      hl_group = "lualine_c_normal",
    })
    local custom_auto = require("lualine.themes.auto")
    -- custom_auto.normal.a.bg = '#112233'
    -- custom_auto.normal.b.bg = '#112233'
    -- custom_auto.normal.c.bg = '#292c3c' -- only add this using frappe
    -- custom_auto.normal.c.bg = '#181926' -- only add this using mocha
    custom_auto.normal.c.bg = 'NONE' -- only use this if wanting a transparent background

    lualine.setup({

      options = {
        theme = custom_auto,
        section_separators = { left = "", right = "" },
        component_separators = { left = "", right = "" },
        disabled_filetypes = {},
        globalstatus = true,
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch" },
        lualine_c = {
          {
            'filetype',
            colored = true,             -- Displays filetype icon in color if set to true
            icon_only = true,           -- Display only an icon for filetype
            icon = { align = 'right' }, -- Display filetype icon on the right hand side
            padding = { left = 1, right = 0 },
            -- icon =    {'X', align='right'}
            -- Icon string ^ in table is ignored in filetype component
          },

          {
            'filename',
            file_status = true,     -- Displays file status (readonly status, modified status)
            newfile_status = false, -- Display new file status (new file means no write after created)
            path = 0,               -- 0: Just the filename
            -- 1: Relative path
            -- 2: Absolute path
            -- 3: Absolute path, with tilde as the home directory
            -- 4: Filename and parent dir, with tilde as the home directory

            shorting_target = 40, -- Shortens path to leave 40 spaces in the window
            -- for other components. (terrible name, any suggestions?)
            symbols = {
              modified = '●', -- Text to show when the file is modified.
              readonly = '[]', -- Text to show when the file is non-modifiable or readonly.
              unnamed = '[No Name]', -- Text to show for unnamed buffers.
              newfile = '[New]', -- Text to show for newly created file before first write
            },
            padding = { left = 1, right = 0 },
          },
          -- {
          --   "buffers",
          -- },
          -- {
          --   symbols and symbols.get,
          --   cond = function()
          --     return vim.b.trouble_lualine ~= false and symbols.has()
          --   end,
          --   padding = { left = 1, right = 1 },
          --   color = { bg = "#81c8be" },
          -- },
          "diagnostics",
          -- {
          --   "buffers",
          --   show_filename_only = true,
          --   show_modified_status = true,
          --   symbols = {
          --     modified = ' ●', -- Text to show when the buffer is modified
          --     alternate_file = '', -- Text to show to identify the alternate file
          --     directory = '', -- Text to show when the buffer is a directory
          --   },
          -- }
        },

        lualine_x = {
          -- add status from noice (especially for showing macro recording in statusline)
          -- {
          --   require("noice").api.status.message.get_hl,
          --   cond = require("noice").api.status.message.has,
          -- },
          -- {
          --   require("noice").api.status.command.get,
          --   cond = require("noice").api.status.command.has,
          --   color = { fg = "#ff9e64" },
          -- },
          {
            require("noice").api.status.mode.get,
            cond = require("noice").api.status.mode.has,
            color = { fg = "#ff9e64" },
          },
          {
            require("noice").api.status.search.get,
            cond = require("noice").api.status.search.has,
            color = { fg = "#ff9e64" },
          },
          "diff",
          {
            "lsp_status",
            icons_enabled = false,
            color = { fg = "#81c8be" },
            colored = true,
            padding = { left = 1, right = 1 },
          },
          {
            lazy_status.updates,
            cond = lazy_status.has_updates,
            padding = { left = 1, right = 1 },
            color = { fg = "#ff9e64" },
          },
        },
        lualine_y = {
          { "progress", separator = " ",                  padding = { left = 1, right = 0 } },
          { "location", padding = { left = 0, right = 1 } },
        },
        lualine_z = {
          { function()
            return " " .. os.date("%R")
          end,
          },
        },
      },
    })
  end,

}
