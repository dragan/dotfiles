return {
  "amitds1997/remote-nvim.nvim",
  version = "*", -- Pin to GitHub releases
  dependencies = {
    "nvim-lua/plenary.nvim", -- For standard functions
    "MunifTanjim/nui.nvim", -- To build the plugin UI
    "nvim-telescope/telescope.nvim", -- For picking b/w different remote methods
  },
  config = true,
  opts = {
    client_callback = function(port, workspace_config)
      local title = ("'Remote: %s'"):format(workspace_config.host)
      local neovim_cmd = ("/opt/homebrew/bin/nvim --server localhost:%s --remote-ui"):format(port)
      local tmux_cmd = ("/opt/homebrew/bin/tmux new-session -s \"%s\" %s \\; split-window -v \\; attach"):format(
        workspace_config.host,
        neovim_cmd
      )
      local cmd = ("alacritty msg create-window --title %s --command %s"):format(
        title,
        tmux_cmd
      )
      vim.fn.jobstart(cmd, {
        detach = true,
        on_exit = function(job_id, exit_code, event_type)
          -- This function will be called when the job exits
          print("Client", job_id, "exited with code", exit_code, "Event type:", event_type)
        end,
      })
    end,
  }
}
