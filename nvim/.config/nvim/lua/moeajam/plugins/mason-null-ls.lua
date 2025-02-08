-- helps ensure both google-java-format and checkstyle are installed using mason
return {
	"jay-babu/mason-null-ls.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"williamboman/mason.nvim",
		"nvimtools/none-ls.nvim",
	},
	opt = {
		ensure_installed = {
			"checkstyle",
			"google-java-format",
		},
	},
}
