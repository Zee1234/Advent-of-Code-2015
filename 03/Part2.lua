local file = io.open 'input.txt'
local input = file:read '*all':gsub('[^%^><v]', '')
file:close()

local grid = {[0] = {[0] = 2}}
local up = function(pos) return {pos[1], pos[2]+1} end
local down = function(pos) return {pos[1], pos[2]-1} end
local left = function(pos) return {pos[1]-1, pos[2]} end
local right = function(pos) return {pos[1]+1, pos[2]} end


local pos = {}
pos.santa = {0,0}
pos.robo = {0,0}
function pos.update(user, direction)
  local old = pos[user]
  if direction:match 'v' then
    pos[user] = down(old)
  elseif direction:match '%^' then
    pos[user] = up(old)
  elseif direction:match '>' then
    pos[user] = right(old)
  elseif direction:match '<' then
    pos[user] = left(old)
  end
end
function updateGrid(user)
  grid[pos[user][1]] = grid[pos[user][1]] or {}
  grid[pos[user][1]][pos[user][2]] = (
    grid[pos[user][1]][pos[user][2]] and 
    grid[pos[user][1]][pos[user][2]] + 1 or 
    1
  )
end
local step = 0
for char in input:gmatch '.' do
  if step%2 == 0 then
    pos.update('santa', char)
    updateGrid('santa')
  else 
    pos.update('robo', char)
    updateGrid('robo')
  end

  step = step + 1
end

local count = 0
for _, v1 in pairs(grid) do
  for _, v2 in pairs(v1) do
    if v2 >= 1 then count = count + 1 end
  end
end

print(count)