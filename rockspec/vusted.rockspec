package = "vusted"
version = "{EDIT_VERSION}-1"
source = {url = "git+https://github.com/notomo/vusted.git", tag = "v{EDIT_VERSION}"}
description = {
  summary = "`busted` wrapper for testing neovim plugin",
  detailed = [[]],
  homepage = "https://github.com/notomo/vusted",
  license = "MIT <http://opensource.org/licenses/MIT>",
}
dependencies = {"busted >= 2.0.0"}
build = {
  type = "builtin",
  modules = {["vusted.assert"] = "lua/vusted/assert.lua", ["vusted.run"] = "lua/vusted/run.lua"},
  install = {bin = {"bin/entry.vim", "bin/vusted", "bin/vusted.bat"}},
}