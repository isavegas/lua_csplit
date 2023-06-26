set shell := ["sh", "-cu"]
set dotenv-load
set positional-arguments

name := "lua_csplit"
# -> list
@default: list

# List just targets
@list:
    just --list --unsorted --list-heading "$(printf 'Targets for {{name}}::\n\r')"

# Platform info
@info:
    echo {{name}} :: {{os()}} {{arch()}}

alias b := build
@build:
    luarocks make

@clean:
    rm *.so *.o

alias t := test
@test: build
    busted .
