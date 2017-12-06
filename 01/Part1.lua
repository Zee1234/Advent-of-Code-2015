local file = io.open('input.txt')
local input = file:read('*all')
file:close()

local level = 0
for char in input:gmatch '[%(%)]' do
  if char == '(' then level = level + 1 end
  if char == ')' then level = level - 1 end
end

print(level)