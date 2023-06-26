rockspec_format = "1.1"
package = "csplit"
version = "1.0-1"
source = {
   url = "https://github.com/isavegas/lua_csplit"
}
description = {
   homepage = "https://github.com/isavegas/lua_csplit",
   license = "MIT"
}
dependencies = {
   "lua >= 5.1, < 5.5"
}
build = {
   type = "builtin",
   modules = {
      csplit = {
         sources = "csplit.c"
      }
   }
}
