local theme = os.getenv("COLORTHEME")

if theme == "light" then
  -- vim.cmd.colorscheme "catppuccin-latte"
  require("nightfox")
  vim.o.background = "light"
  vim.cmd.colorscheme("dawnfox")
elseif theme == "dark" then
  require("nightfox")
  vim.o.background = "dark"
  vim.cmd.colorscheme("nightfox")
-- vim.g.gruvbox_material_enable_italic = true
-- vim.g.gruvbox_material_enable_bold = true
-- vim.g.gruvbox_material_background = 'hard'
-- vim.o.background = "dark"
else
  require("kanagawa")
  vim.cmd.colorscheme("kanagawa")
end
