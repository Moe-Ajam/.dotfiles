return {
	"epwalsh/obsidian.nvim",
	version = "*", -- recommended, use latest release instead of latest commit
	lazy = true,
	ft = "markdown",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
	},
	opts = {
		workspaces = {
			{
				name = "Personal",
				path = "/Users/mahmoudajam/Documents/Personal",
			},
		},
		notes_subdir = "1_Inbox",
		new_notes_location = "notes_subdir",
		completion = {
			nvim_cmp = true,
			min_chars = 2,
		},
		use_telescope = true,

		mappings = {
			["gf"] = {
				action = function()
					return require("obsidian").util.gf_passthrough()
				end,
				opts = { noremap = false, expr = true, buffer = true },
			},
		},
		templates = {
			subdir = "Templates",
			date_format = "%Y-%m-%d",
			time_format = "%H:%M:%S",
		},

		autoformat = false,

		-- Optional, alternatively you can customize the frontmatter data.
		---@return table
		note_frontmatter_func = function(note)
			-- Add the title of the note as an alias.
			if note.title then
				note:add_alias(note.title)
			end

			local out = { tags = note.tags, source = note.source }

			-- `note.metadata` contains any manually added fields in the frontmatter.
			-- So here we just make sure those fields are kept in the frontmatter.
			if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
				for k, v in pairs(note.metadata) do
					out[k] = v
				end
			end

			return out
		end,

		ui = {
			enable = true,
			update_debounce = 200,
			max_file_length = 5000,
			checkboxes = {
				[" "] = { char = "󰄱", hl_group = "ObsidianTodo" },
				["x"] = { char = "", hl_group = "ObsidianDone" },
				[">"] = { char = "", hl_group = "ObsidianRightArrow" },
				["~"] = { char = "󰰱", hl_group = "ObsidianTilde" },
				["!"] = { char = "", hl_group = "ObsidianImportant" },
			},
			bullets = { char = "•", hl_group = "ObsidianBullet" },
			external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
			reference_text = { hl_group = "ObsidianRefText" },
			highlight_text = { hl_group = "ObsidianHighlightText" },
			tags = { hl_group = "ObsidianTag" },
			block_ids = { hl_group = "ObsidianBlockID" },
			hl_groups = {
				ObsidianTodo = { bold = true, fg = "#f78c6c" },
				ObsidianDone = { bold = true, fg = "#89ddff" },
				ObsidianRightArrow = { bold = true, fg = "#f78c6c" },
				ObsidianTilde = { bold = true, fg = "#ff5370" },
				ObsidianImportant = { bold = true, fg = "#d73128" },
				ObsidianBullet = { bold = true, fg = "#89ddff" },
				ObsidianRefText = { underline = true, fg = "#c792ea" },
				ObsidianExtLinkIcon = { fg = "#c792ea" },
				ObsidianTag = { italic = true, fg = "#89ddff" },
				ObsidianBlockID = { italic = true, fg = "#89ddff" },
				ObsidianHighlightText = { bg = "#75662e" },
			},
		},
	},
	disable_formatter = true,
	config = function()
		-- navigate to vault
		vim.keymap.set("n", "<leader>oo", ":cd /Users/mahmoudajam/Documents/Personal<cr>")
		-- convert note to template and remove leading white space
		vim.keymap.set(
			"n",
			"<leader>on",
			":ObsidianTemplate Note Template<cr> :lua vim.cmd([[1,/^\\S/s/^\\n\\{1,}//]])<cr>"
		)
		-- strip date from note title and replace dashes with spaces
		-- must have cursor on title
		-- vim.keymap.set('n', '<leader>of', ':s/\\(# \\)[^_]*_/\\1/ | s/-/ /g<cr>')
		vim.keymap.set("n", "<leader>of", ":s/\\(# \\)[^_]*_/\\1/ | s/-/ /g | s/\\v<(.)(\\w*)>/\\u\\1\\L\\2/g<cr>")

		-- for review workflow
		-- move file in current buffer to zettelkasten folder
		vim.keymap.set("n", "<leader>ok", ":!mv '%:p' /Users/mahmoudajam/Documents/Personal<cr>:bd<cr>")

		vim.keymap.set("n", "<leader>ok", ":!mv '%:p' /Users/mahmoudajam/Documents/Personal/3_Slip\\ box<cr>:bd<cr>")
		-- delete file in current buffer
		vim.keymap.set("n", "<leader>odd", ":!rm '%:p'<cr>:bd<cr>")
	end,
}
