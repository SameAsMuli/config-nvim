local M = {}

local Log = require("util.log")

-- generic function to trigger external commands
function M.run(cmd, opts)
  assert(type(cmd) == "table" or type(cmd) == "string", "run expects a table or string")
  local cmd_name
  if type(cmd) == "table" then
    cmd_name = cmd[1]
  else
    cmd_name = cmd:gmatch("%S+")()
  end
  local title = cmd_name

  if opts then
    if opts.title then
      title = opts.title
    end
  end

  if vim.fn.executable(cmd_name) ~= 1 then
    Log.error("Cannot find " .. cmd_name .. " in $PATH", { title = title })
    return
  end
  local ctags_job = vim.fn.jobstart(cmd, {
    detach = true,
    on_stdout = function(_, data, _)
      Log.info(data, { title = title })
    end,
    on_stderr = function(_, data, _)
      Log.error(data, { title = title })
    end,
    on_exit = function(_, ret, _)
      if ret == 0 then
        Log.info("Complete!", { title = title })
      else
        Log.error("Command failed with code [" .. ret .. "]", { title = title })
      end
    end,
    stdout_buffered = false,
    stderr_buffered = false,
  })
  if ctags_job <= 0 then
    local msg = {
      "Failed to run " .. cmd_name,
      ctags_job,
      vim.inspect(cmd),
    }
    Log.error(msg, { title = title })
    return
  end
end

return M
