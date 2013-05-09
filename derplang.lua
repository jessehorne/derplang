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
require("lib.std")
function string:split(sep) -- string split function
  local sep, fields = sep or " ", {}
  local pattern = string.format("([^%s]+)", sep)
  self:gsub(pattern, function(c) fields[#fields+1] = c end)
  return fields
end
file = assert(io.open(arg[1]), "[DERP]: You derped loading your file.") -- loads file
file_txt = file:read("*all") -- creates a string containing the derp script
file:close() -- closes file
t = file_txt:split(":") -- Splits string into table
global_error = false -- global for determining if an error interupts the loop
local t_length = 0 -- Declares script length as 0
for i,v in ipairs(t) do -- Declares script length
  t_length = i
end
t_length = t_length - 1 -- Must do
start_place = 1
while global_error == false do
  for i=start_place, t_length do
    if t[i] == "nu" then
      nu(t[i+1], tonumber(t[i+2]))
    elseif t[i] == "st" then
      st(t[i+1], t[i+2])
    elseif t[i] == "ou" then
      ou(t[i+1])
    elseif t[i] == "co" then
      co(t[i+1], t[i+2], t[i+3])
    elseif t[i] == "ad" then
      ad(t[i+1], t[i+2], t[i+3])
    elseif t[i] == "su" then
      su(t[i+1], t[i+2], t[i+3])
    elseif t[i] == "mu" then
      mu(t[i+1], t[i+2], t[i+3])
    elseif t[i] == "di" then
      di(t[i+1], t[i+2], t[i+3])
    elseif t[i] == "fo" then
      fo(t[i+1], t[i+2], t[i+3], t[i+4], t[i+5])
    elseif t[i] == "ip" then
      ip(t[i+1])
    elseif t[i] == "gt" then
      going_to = true
      start_place = tonumber(t[i+1])
      break
    elseif t[i] == "it" then
      if _G[t[i+1]] == _G[t[i+2]] then
        going_to = true
        start_place = tonumber(t[i+3])
        break
      else
        going_to = true
        start_place = tonumber(t[i+4])
        break
      end
    end
    going_to = false
  end
  
  if going_to == false then global_error = true end

end

