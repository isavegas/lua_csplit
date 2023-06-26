#include <lauxlib.h>
#include <lua.h>
#include <lualib.h>
#include <string.h>

int csplit(lua_State *state) {
  lua_newtable(state);

  size_t index = 1;
  const char *end;
  const char *start = luaL_checkstring(state, 1);
  size_t delimiter_length = 0;
  const char *seperator = luaL_checklstring(state, 2, &delimiter_length);
  if (delimiter_length != 1) {
    // TODO: Handle multi-character delimiters
    luaL_error(state, "WIP: cannot split on multi-character delimiter");
  }

  while ((end = strchr(start, *seperator)) != NULL) {
    lua_pushlstring(state, start, end - start);
    lua_rawseti(state, -2, index++);
    start = end + 1;
  }

  lua_pushstring(state, start);
  lua_rawseti(state, -2, index);

  return 1;
}

int luaopen_csplit(lua_State *state) {
  lua_pushcfunction(state, csplit);
  return 1;
}
