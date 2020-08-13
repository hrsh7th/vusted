local assert = require("luassert")
local say = require("say")

local M = {}

local asserts = {}
asserts.__index = asserts

function asserts.create(name)
  local assert_fn = {
    name = name,
    positive = ("assertion.%s.positive"):format(name),
    negative = ("assertion.%s.negative"):format(name),
  }
  return setmetatable(assert_fn, asserts)
end

function asserts.set_positive(self, msg)
  say:set(self.positive, msg)
end

function asserts.set_negative(self, msg)
  say:set(self.negative, msg)
end

function asserts.register(self, fn)
  assert:register("assertion", self.name, fn(self), self.positive, self.negative)
end

function asserts.register_eq(self, get_actual)
  local fn = function(_, args)
    local expected = args[#args]
    local actual = get_actual(unpack(args, 1, #args - 1))

    local positive_msg = ("%s should be %s, but actual: %s"):format(self.name, expected, actual)
    self:set_positive(positive_msg)
    local negative_msg = ("%s should not be %s, but actual: %s"):format(self.name, expected, actual)
    self:set_negative(negative_msg)

    return actual == expected
  end
  self:register(function(_)
    return fn
  end)
end

M.asserts = asserts
M.assert = assert

return M
