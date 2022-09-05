Dotenv
=======
### Simple dotenv parser for luvit made for basic use

Install the package
```sh
lit install 4keef/Dotenv
```
Basic usage
```lua
local Dotenv = require('Dotenv')

-- Pass in the path
Dotenv.load_env(path)

local env = require('env')

-- Get values via env module
print(env.get('TEST'))
```

