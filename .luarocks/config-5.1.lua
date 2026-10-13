-- ~/.luarocks/config-5.1.lua

-- default config see https://github.com/luarocks/luarocks/blob/d4e82aae9f411d5d2cac10f7e043a0c3c6180eb1/src/luarocks/core/cfg.lua#L167

--  http://lua-users.org/wiki/LuaRocksConfig
--  https://github.com/luarocks/luarocks/wiki/Dependencies
--  https://github.com/luarocks/luarocks/wiki/Documentation


lua_version = "5.1"

local_by_default = true

lua_interpreter = "luajit"

-- lua_modules_path = "/share/lua/"..lua_version
-- lib_modules_path = "/lib/lua/"..lua_version

-- for 5.1 ROCKS_TREE is `/home/ttys3/.luarocks/lib/luarocks/rocks-5.1`
-- so rocks_subdir is `lib/luarocks/rocks-5.1`, no need to change the default
-- set it to full absolute path is incorrect, it does not need the `~/.luarocks` part
-- otherwise both `variables.ROCKS_TREE` and `rocks_dir` value will be wrong
-- remember:  `rocks_dir = home_tree .. rocks_subdir`
-- system: /usr/lib/luarocks/rocks-5.1
-- user: /home/ttys3/.luarocks/lib/luarocks/rocks-5.1
-- rocks_subdir = "/lib/luarocks/rocks-"..lua_version

variables = {
    LUA = lua_interpreter,
    LUA_DIR = "/usr",
    LUA_BINDIR = "/usr/bin",
    LUA_INCDIR = "/usr/include/luajit-2.1/"
}
