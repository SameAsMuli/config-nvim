local function split(var)
  local list = {}
  for entry in var:gmatch("([^:]+)") do
    list[#list + 1] = entry
  end
  return list
end

HOME = os.getenv("HOME")

XDG_CACHE_HOME = os.getenv("XDG_CACHE_HOME") or (HOME and HOME .. "/.cache")
XDG_CONFIG_HOME = os.getenv("XDG_CONFIG_HOME") or (HOME and HOME .. "/.config")
XDG_DATA_HOME = os.getenv("XDG_DATA_HOME") or (HOME and HOME .. "/.local/share")
XDG_RUNTIME_DIR = os.getenv("XDG_RUNTIME_DIR")

XDG_DATA_DIRS = split(os.getenv("XDG_DATA_DIRS") or "/usr/local/share:/usr/share")
if XDG_DATA_HOME then
  table.insert(XDG_DATA_DIRS, 1, XDG_DATA_HOME)
end
table.insert(XDG_DATA_DIRS, XDG_RUNTIME_DIR)

XDG_CONFIG_DIRS = split(os.getenv("XDG_CONFIG_DIRS") or "/etc/xdg")
if XDG_CONFIG_HOME then
  table.insert(XDG_CONFIG_DIRS, 1, XDG_CONFIG_HOME)
end

XDG_CACHE_DIRS = {}
table.insert(XDG_CACHE_DIRS, XDG_CACHE_HOME)
table.insert(XDG_CACHE_DIRS, XDG_RUNTIME_DIR)
