return {
	-- rose-pine configuration
	{
		"rose-pine/neovim",
		priority = 1000,
		config = function()
			require("rose-pine").setup({
				variant = "main", -- auto, main, moon, or dawn
				dark_variant = "main", -- main, moon, or dawn
				dim_inactive_windows = false,
				extend_background_behind_borders = true,
				enable = {
					terminal = true,
					legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
					migrations = true, -- Handle deprecated options automatically
				},
				styles = {
					bold = true,
					italic = true,
				},
			})
			vim.opt.fillchars = { eob = " " }
			vim.cmd("colorscheme rose-pine")
		end,
	},
	{
		-- Onedark configuration
		"navarasu/onedark.nvim",
		priority = 1001, -- Higher priority than rose-pine to make this the default
		config = function()
			require("onedark").setup({
				style = "darker", -- Options: 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light'
				term_colors = true,
				ending_tildes = false, -- Remove ~ on unused lines
				styles = {
					comments = "none",
					functions = "bold",
					keywords = "bold",
					variables = "bold",
				},
			})
			-- vim.cmd("colorscheme onedark")
		end,
	},
	-- Tokyonight colorscheme configuration
	{
		"folke/tokyonight.nvim",
		priority = 1002, -- Adjust priority so that it loads in the order you want
		config = function()
			require("tokyonight").setup({
				style = "night", -- Choose between 'storm', 'night', 'moon', or 'day'
				transparent = false, -- Enable or disable the background transparency
				terminal_colors = true, -- Apply the colorscheme to the terminal
				styles = {
					comments = { italic = false },
					keywords = { italic = false },
					functions = { bold = false },
					variables = { bold = false },
				},
			})
			-- Set Tokyonight as the colorscheme
			-- vim.cmd("colorscheme tokyonight")
		end,
	},
}
