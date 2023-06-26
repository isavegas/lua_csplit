#!/usr/bin/env lua

local csplit = require('csplit')

describe("csplit", function()
    it("should return a single empty string for empty string", function()
        assert.are.same(csplit("", ","), {""})
    end)
    it("should handle single char delimiters correctly", function()
        assert.are.same(csplit("a,b", ","), {"a", "b"})
    end)
    it("should include empty string if string ends with delimiter", function()
        assert.are.same(csplit("a,b,", ","), {"a", "b", ""})
    end)
    it("should include empty string if string starts with delimiter", function()
        assert.are.same(csplit(",a,b", ","), {"", "a", "b"})
    end)
    it("should include empty string for adjacent delimiters", function()
        assert.are.same(csplit("a,,b", ","), {"a", "", "b"})
    end)
    --[[
    it("should correctly handle multi-character delimiters", function()
        assert.are.same(csplit("->a->b->", "->"), {"", "a", "", "b", ""})
    end)
    ]]
end)
