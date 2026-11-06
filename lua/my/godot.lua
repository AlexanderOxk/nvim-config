local is_godot_project = false
local cwd = vim.fn.getcwd()

-- Is CWD a godot project?
if vim.uv.fs_stat(cwd .. '/project.godot') then
    is_godot_project = true
end

-- check if server is already running in project path
local is_server_running = vim.uv.fs_stat(cwd .. '/server.pipe')

-- start server, if not already running
if is_godot_project and not is_server_running then
    vim.fn.serverstart(cwd .. '/server.pipe')
end

