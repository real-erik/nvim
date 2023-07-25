package.path = package.path .. ";/Users/ewaasen/.config/nvim/lua/utils/?.lua"


-- run "just watch" from .config/nvim root

local git = require("git")
describe("git", function()
  it("works", function()
    local url = git.open_web_client_file()
    assert.equal("https://github.com/ErikAasen-RSS/nvim", url)
  end)
end)
