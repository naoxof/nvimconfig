return {
	"monaqa/dial.nvim",
	keys = {
		{ "<C-a>", function() require("dial.map").manipulate("increment", "normal") end, desc = "Increment", mode = "n" },
		{ "<C-x>", function() require("dial.map").manipulate("decrement", "normal") end, desc = "Decrement", mode = "n" },
		{ "g<C-a>", function() require("dial.map").manipulate("increment", "gnormal") end, desc = "Increment (g)", mode = "n" },
		{ "g<C-x>", function() require("dial.map").manipulate("decrement", "gnormal") end, desc = "Decrement (g)", mode = "n" },
		{ "<C-a>", function() require("dial.map").manipulate("increment", "visual") end, desc = "Increment", mode = "x" },
		{ "<C-x>", function() require("dial.map").manipulate("decrement", "visual") end, desc = "Decrement", mode = "x" },
		{ "g<C-a>", function() require("dial.map").manipulate("increment", "gvisual") end, desc = "Increment (g)", mode = "x" },
		{ "g<C-x>", function() require("dial.map").manipulate("decrement", "gvisual") end, desc = "Decrement (g)", mode = "x" },
	},
	config = function()
		local augend = require("dial.augend")
		require("dial.config").augends:register_group({
			default = {
				augend.integer.alias.decimal,
				augend.integer.alias.hex,
				augend.date.alias["%Y/%m/%d"],
				augend.date.alias["%Y-%m-%d"],
				augend.constant.alias.bool,
				augend.semver.alias.semver,
			},
		})
	end,
}
