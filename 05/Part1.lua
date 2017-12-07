local function vowelCheck(str)
  local count = 0
  for s in str:gmatch '[aeiou]' do
    count = count + 1
    if count>2 then return true end
  end
  return false
end
local function doubleCheck(str)
  for i = 1, str:len() do
    local nxt = str:sub(i+1, i+1)
    if nxt and str:sub(i, i) == nxt then return true end
  end
  return false
end
local function badCheck(str)
  return not (
    str:match 'ab' or
    str:match 'cd' or
    str:match 'pq' or
    str:match 'xy'
  )
end

local count = 0
for line in io.lines 'input.txt' do
  if badCheck(line) and doubleCheck(line) and vowelCheck(line) then count = count + 1 end
end

print(count)