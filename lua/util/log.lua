local M = {}

local async = require("plenary.async")
local has_notify, notify = pcall(require, "notify")

local String = require("util.string")

local function log(msg, level, opts)
  assert(type(msg) == "table" or type(msg) == "string", "log expects a table or string")
  if type(msg) == "table" then
    -- trim leading empty lines
    for key, value in pairs(msg) do
      if String.is_blank(value) then
        table.remove(msg, key)
      else
        break
      end
    end
    -- trim trailing empty lines
    for i = #msg, 1, -1 do
      local value = msg[i]
      if String.is_blank(value) then
        table.remove(msg, i)
      else
        break
      end
    end
    msg = table.concat(msg, "\n")
    if #msg <= 0 then
      return
    end
  end
  if has_notify then
    async.run(function()
      notify.async(msg, level, opts)
    end, function() end)
  else
    local str_to_vim_level = {
      ["info"] = vim.log.levels.INFO,
      ["warn"] = vim.log.levels.WARN,
      ["error"] = vim.log.levels.ERROR,
      ["debug"] = vim.log.levels.DEBUG,
      ["trace"] = vim.log.levels.TRACE,
    }
    local prefix = ""
    if opts.title ~= nil then
      prefix = opts.title .. ": "
      local _, newline_count = msg:gsub("\n", "")
      if newline_count > 0 then
        prefix = prefix .. "\n"
      end
    end
    vim.notify(prefix .. msg, str_to_vim_level[level])
  end
end

-- external log functions
function M.info(msg, opts)
  log(msg, "info", opts)
end
function M.warn(msg, opts)
  log(msg, "warn", opts)
end
function M.error(msg, opts)
  log(msg, "error", opts)
end
function M.debug(msg, opts)
  log(msg, "debug", opts)
end
function M.trace(msg, opts)
  log(msg, "trace", opts)
end

return M
