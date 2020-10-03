ifeq ($(OS),Windows_NT)
	VUSTED := bin\vusted
else
	VUSTED := bin/vusted
endif

test:
	${VUSTED}
.PHONY: test


TARGET_VERSION := x.x.x
LUA_EXE := lua

try:
	$(MAKE) _release DRY_RUN=dry-run
.PHONY: try

release:
	luarocks install lua-cjson
	LUAROCKS_API_KEY=${LUAROCKS_API_KEY} $(MAKE) _release
.PHONY: release

_release:
	luarocks install penlight
	${LUA_EXE} release.lua ${TARGET_VERSION} ${DRY_RUN}
.PHONY: _release
