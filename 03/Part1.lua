local file = io.open 'input.txt'
local input = ' '..file:read '*all':gsub('[^%^><v]', '')
file:close()

local grid = {}
local up = function(pos) return {pos[1], pos[2]+1} end
local down = function(pos) return {pos[1], pos[2]-1} end
local left = function(pos) return {pos[1]-1, pos[2]} end
local right = function(pos) return {pos[1]+1, pos[2]} end


local pos = {0,0}
for char in input:gmatch '.' do
  if char:match 'v' then
    pos = down(pos)
  elseif char:match '%^' then
    pos = up(pos)
  elseif char:match '>' then
    pos = right(pos)
  elseif char:match '<' then
    pos = left(pos)
  end
  grid[pos[1]] = grid[pos[1]] or {}
  grid[pos[1]][pos[2]] = grid[pos[1]][pos[2]] and grid[pos[1]][pos[2]] + 1 or 1
end

local count = 0
for _, v1 in pairs(grid) do
  for _, v2 in pairs(v1) do
    if v2 >= 1 then count = count + 1 end
  end
end

print(count)