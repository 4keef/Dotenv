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
Dotenv.load_env(path_to_env)

-- Call without the path 
Dotenv.load_env() 

-- Get value using key
Dotenv.get_value("test")

-- Set value of enviroment variable 
Dotenv.set_value("test", 1000)
```

