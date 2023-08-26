local M = {}

function M.is_blank(s)
  return s == nil or #string.gsub(s, "^%s*(.-)%s*$", "%1") == 0
end

return M
