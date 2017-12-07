local function pairCheck(line)
  for i = 1, line:len() do
    local str = line:sub(i, i+1)
    if line:match( ('%s.*%s'):format(str, str) ) then return true end
  end
  return false
end
local function sandwichCheck(line)
  for i = 1, line:len()-2 do
    if line:sub(i+2, i+2) == line:sub(i, i) then return true end
  end
  return false
end

local count = 0
for line in io.lines 'input.txt' do
  if pairCheck(line) and sandwichCheck(line) then count = count + 1 end
end

print(pairCheck 'uuuu' and sandwichCheck 'uuuu')

print(count)