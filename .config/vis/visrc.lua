require("vis")

local plug = (function()
	if not pcall(require, 'plugins/vis-plug') then
		os.execute('git clone --quiet https://github.com/erf/vis-plug ' ..
			(os.getenv('XDG_CONFIG_HOME') or os.getenv('HOME') .. '/.config')
			.. '/vis/plugins/vis-plug')
	end
	return require('plugins/vis-plug')
end)()
-- require('plugins/vis-plug')

-- configure plugins in an array of tables with git urls and options
local plugins = {
	{ 'jpaulogg/vis-ins-completion '},
	{ 'e-zk/vis-shebang' },
	{ 'kupospelov/vis-ctags' },
	{ 'pshevtsov/base16-vis',  file = 'themes/base16-onedark',  theme = true },
}

-- require and optionally install plugins on init
plug.init(plugins, true)

require('plugins/vis-lspc')
