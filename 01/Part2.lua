local file = io.open('input.txt')
local input = file:read('*all')
file:close()

local level = 0
pos = 0
for char in input:gmatch '[%(%)]' do
  if char == '(' then level = level + 1 end
  if char == ')' then level = level - 1 end
  pos = pos + 1
  if level < 0 then break end
end

print(pos)