local env = require 'env'
local path = require 'path'
local pretty = require 'pretty-print'
local filesys = require 'fs'
local env = require 'env'

local M = {}

local stats = filesys.statSync
local readdir = filesys.readdirSync
local exists = filesys.existsSync


function M.set_key(name, value)

end

--- Get value from environment
-- @param key (string) The name of the environment variable
-- @return (any) The value stored in the environment variable
function M.get_value(key)
end

function M.load_env(route)
  if route and not exists(route) then
    error("Not valid file path \"" .. route .. "\" OR it does not exists", 1)
  else
    -- Path of current directory
    route = path.resolve()
  end

  io.write(route)
  -- Returns data on the file/dir
  local stat = stats(route)

  pretty.prettyPrint(stat)

  if stat and stat.type == "directory" then
    M.load_env(path.join(route, '.env'))
  end

  local dotenv = io.open(route, "r")
  local content = io.read(dotenv)

  io.write(content)


  return io.close(dotenv)
end


M.load_env("./.env")
return M
