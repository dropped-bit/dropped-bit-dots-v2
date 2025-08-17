return {
  "snacks.nvim",
  opts = {
    indent = { enabled = true },
    input = { enabled = true },
    notifier = { enabled = true },
    scope = { enabled = true },
    scroll = { enabled = true },
    statuscolumn = { enabled = false }, -- we set this in options.lua
    toggle = { map = LazyVim.safe_keymap_set },
    words = { enabled = true },
  },
  -- stylua: ignore
  keys = {
    { "<leader>fe", function()
      if Snacks.config.picker and Snacks.config.picker.enabled then
        Snacks.explorer.open()
      else
        Snacks.explorer.close()
      end
    end, desc = "[F]ile [E]xplorer" },
  },
}
