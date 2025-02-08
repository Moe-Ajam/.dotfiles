-- real-time debugging for java
return {
	-- DAP
	{
		"mfussenegger/nvim-dap",
		config = function()
			local dap, dapui = require("dap"), require("dapui")

			-- Auto Open DAP UI when debugging starts
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			-- Auto Close DAP UI when debugging ends
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.after.event_exited["dapui_config"] = function()
				dapui.close()
			end

			-- Useful DAP Keymaps with Descriptions
			vim.keymap.set("n", "<Leader>do", function()
				dapui.open()
			end, { desc = "[DAP] Open Debug UI" })
			vim.keymap.set("n", "<Leader>dc", function()
				dap.continue()
			end, { desc = "[DAP] Start/Continue Debugging" })
			vim.keymap.set("n", "<Leader>dso", function()
				dap.step_over()
			end, { desc = "[DAP] Step Over" })
			vim.keymap.set("n", "<Leader>dsi", function()
				dap.step_into()
			end, { desc = "[DAP] Step Into" })
			vim.keymap.set("n", "<Leader>dsb", function()
				dap.step_out()
			end, { desc = "[DAP] Step Out" })
			vim.keymap.set("n", "<Leader>b", function()
				dap.toggle_breakpoint()
			end, { desc = "[DAP] Toggle Breakpoint" })
			vim.keymap.set("n", "<Leader>B", function()
				dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
			end, { desc = "[DAP] Set Conditional Breakpoint" })
			vim.keymap.set("n", "<Leader>lp", function()
				dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
			end, { desc = "[DAP] Set Log Point Breakpoint" })
			vim.keymap.set("n", "<Leader>dr", function()
				dap.repl.open()
			end, { desc = "[DAP] Open REPL Console" })
			vim.keymap.set("n", "<Leader>dl", function()
				dap.run_last()
			end, { desc = "[DAP] Run Last Debug Session" })
			vim.keymap.set("n", "<Leader>dq", function()
				dapui.close()
			end, { desc = "[DAP] Close Debug UI" })

			vim.keymap.set({ "n", "v" }, "<Leader>dh", function()
				require("dap.ui.widgets").hover()
			end, { desc = "[DAP] Hover Variables" })

			vim.keymap.set({ "n", "v" }, "<Leader>dp", function()
				require("dap.ui.widgets").preview()
			end, { desc = "[DAP] Preview Variables" })

			vim.keymap.set("n", "<Leader>df", function()
				local widgets = require("dap.ui.widgets")
				widgets.centered_float(widgets.frames)
			end, { desc = "[DAP] Show Frames" })

			vim.keymap.set("n", "<Leader>dsc", function()
				local widgets = require("dap.ui.widgets")
				widgets.centered_float(widgets.scopes)
			end, { desc = "[DAP] Show Scopes" })
		end,
	},

	-- DAP UI
	{
		"rcarriga/nvim-dap-ui",
		lazy = true,
		dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
		config = function()
			require("dapui").setup()
		end,
	},

	-- DAP Virtual Text
	{
		"theHamsta/nvim-dap-virtual-text",
		dependencies = { "mfussenegger/nvim-dap", "nvim-treesitter/nvim-treesitter" },
		config = function()
			require("nvim-dap-virtual-text").setup()
		end,
	},
}
