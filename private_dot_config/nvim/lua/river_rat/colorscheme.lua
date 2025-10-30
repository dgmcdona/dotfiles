local theme = os.getenv("COLORTHEME")

if theme == "light" then
  require("nightfox")
  vim.o.background = "light"
  vim.cmd.colorscheme("dawnfox")
elseif theme == "dark" then
  require("nightfox")
  vim.o.background = "dark"
  vim.cmd.colorscheme("nightfox")
else
  require("kanagawa")
  vim.cmd.colorscheme("kanagawa")
end
