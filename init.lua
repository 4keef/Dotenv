local FS = require('fs')
local PATH  = require('path')

local function split(str, sep)
  sep = sep or "%s"
  local t = {}
  for v in string.gmatch(str, "([^"..sep.."]+)") do table.insert(t, v) end
  return t
end

local function load_env(filePath)
  assert(
    FS.existsSync(filePath),
    "Invalid file path \""..filePath.."\""
  )

  local file = io.open(filePath, "r")

  _ENV = {}
  for line in file:lines() do local v = split(line, "=") _ENV[v[1]] = v[2] end
  file:close()
  return true
end


return {
  load_env = load_env
}
