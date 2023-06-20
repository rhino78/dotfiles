require("toggleterm").setup{
	-- size can be a number or function which is passed the current terminal
	--
	open_mapping = [[<c-\>]],
	direction = 'float',
	float_opts = {
		border = 'curved'
	},
}
