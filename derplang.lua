--[[
Copyright (c) 2013 Jesse Horne

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
]]--

function string:split(sep)
  local sep, fields = sep or " ", {}
  local pattern = string.format("([^%s]+)", sep)
  self:gsub(pattern, function(c) fields[#fields+1] = c end)
  return fields
end

file = assert(io.open(arg[1]), "[DERP]: You derped loading your file.")

file_txt = file:read("*all")

file:close()

t = file_txt:split(":")


global_error = false

local t_length = 0
for i,v in ipairs(t) do
  t_length = i
end
t_length = t_length - 1

tables = {}
walls = {}

while global_error == false do

  if t[1] ~= "START" then
    global_error = true
    print("[DERP]: START not found at beginning of script.")
  elseif t[t_length] ~= "DONE" then
    global_error = true
    print("[DERP]: DONE not found at the end of script.")
  end

  for i,v in ipairs(t) do
    if v == "w" then -- IF WALL IS CREATED
      walls[t[i+1]] = {}
     elseif v == "s" then -- IF DATA IS ABOUT TO BE PUT ON A WALL
      table.insert(walls[t[i+1]], t[i+2])
     elseif v == "p" then -- IF A WALL IS ABOUT TO BE PUT ON A TABLE
      ft = table.concat(walls[t[i+1]], " ")
      table.insert(tables, ft)
    end
  end

  global_error = true

end

for i,v in ipairs(tables) do
  print(v)
end


