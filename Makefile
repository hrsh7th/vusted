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
	${LUA_EXE} release.lua ${TARGET_VERSION} dry-run
.PHONY: try

release:
	LUAROCKS_API_KEY=${LUAROCKS_API_KEY} ${LUA_EXE} release.lua ${TARGET_VERSION}
.PHONY: release
