local M = {}

function M.get_remote_url(remote_name)
	local handle = io.popen(string.format("git remote get-url %s", remote_name or "origin"))

	if not handle then
		return
	end

	local remote_url = handle:read("*a")
	handle:close()

	return remote_url
end

function M.get_http_remote_url(remote_name)
	local remote_url = M.get_remote_url(remote_name)

	if not remote_url then
		return
	end

	local url = string.gsub(remote_url, "%.git", "")

	-- Convert SSH url into HTTP url
	if string.find(url, "git@") then
		url = string.gsub(url, "git@", "")
		url = string.gsub(url, ":", "/")
		url = "https://" .. url
	end

	return url
end

function M.open_web_client(remote_name)
	local url = M.get_http_remote_url(remote_name)

	if not url then
    print("Could not determine URL for remote")
		return
	end

	local cmd = string.format("open %s", url)

	os.execute(cmd)
end

return M
