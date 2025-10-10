vim.filetype.add({
  pattern = {
    [".*.schema"] = "sql",
  },
})

vim.filetype.add({
  extension = {
    jsonl = "json",
  },
})
