local groups = {
  "Normal",
  "NormalNC",
  "NormalFloat",
  "FloatBorder",
  "SignColumn",
  "EndOfBuffer",
  "MsgArea",
  "LineNr",
  "CursorLineNr",
  "StatusLine",
  "StatusLineNC",
  "WinSeparator",
}

for _, group in ipairs(groups) do
  vim.api.nvim_set_hl(0, group, { bg = "none" })
end

