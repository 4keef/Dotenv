local fs = require('fs')
local env = require('env')

local function split(str, sep)
  sep = sep or "%s"
  local t = {}
  for v in string.gmatch(str, "([^"..sep.."]+)")
  do
    table.insert(t, v)
  end
  return t
end

local function load_env(path)
  assert(fs.existsSync(path), "Invalid file path \""..path.."\"")
  local file = io.open(path, "r")
  for line in file:lines()
  do
    env.set(unpack(split(line, "=")))
  end
  file:close()
  return true
end

return {
  load_env = load_env
}
