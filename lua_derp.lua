--[[
    lua_derp is the main file
    Creator: Jesse Horne (jessehorne.github.io)
    More documentation can be found http://esolangs.org/wiki/derplang
    GitHub: github.com/jessehorne/derplang
]]--


require("lib.std") -- Standard Library functions for Derplang

-- split is used for splitting a string by a separator
function string:split(sep)
  local sep, fields = sep or " ", {}
  local pattern = string.format("([^%s]+)", sep)
  self:gsub(pattern, function(c) fields[#fields+1] = c end)
  return fields
end

-- trim replaces the newline characters with ""
function trim(s)
  return (s:gsub("\n", ""))
end

file = assert(io.open(arg[1]), "[DERP]: You derped loading your file.") -- loads file

file_txt = file:read("*all") -- creates a string containing the derp script

file:close() -- closes file object

t = file_txt:split(":") -- Splits string into table

global_error = false -- global for determining if an error interupts the loop

local t_length = 0 -- Declares script length as 0

for i,v in ipairs(t) do -- Declares script length
  t[i] = trim(t[i])
  t_length = i
end

t_length = t_length - 1 -- Must do :)

start_place = 1

-- Main loop, that cycles through the code-string, and does things
while global_error == false do
  for i=start_place, t_length do
    if t[i] == "va" then -- VARIABLE DECLARATION
      va(t[i+1], t[i+2])
    elseif t[i] == "ou" then -- OUTPUT
      ou(t[i+1])
    elseif t[i] == "co" then -- CONCATENATE
      co(t[i+1], t[i+2], t[i+3])
    elseif t[i] == "ad" then -- ADD
      ad(t[i+1], t[i+2], t[i+3])
    elseif t[i] == "su" then -- SUBTRACT
      su(t[i+1], t[i+2], t[i+3])
    elseif t[i] == "mu" then -- MULTIPLY
      mu(t[i+1], t[i+2], t[i+3])
    elseif t[i] == "di" then -- DIVIDE
      di(t[i+1], t[i+2], t[i+3])
    elseif t[i] == "fo" then -- FOR LOOP
      fo(t[i+1], t[i+2], t[i+3], t[i+4], t[i+5])
    elseif t[i] == "ip" then -- INPUT
      ip(t[i+1])
    elseif t[i] == "la" then -- LABEL
      _G[t[i+1]] = i
    elseif t[i] == "go" then -- GO
      go(t[i+1])
      break
    elseif t[i] == "eq" then -- IF EQUAL
      con_check(t[i+1], t[i+2], t[i+3], t[i+4], "=")
      break
    elseif t[i] == "gt" then -- IF GREATER THAN
      con_check(t[i+1], t[i+2], t[i+3], t[i+4], ">")
    elseif t[i] == "lt" then -- IF LESS THAN
      con_check(t[i+1], t[i+2], t[i+3], t[i+4], "<")
    elseif t[i] == "ra" then -- RANDOM
      ra(t[i+1], t[i+2], t[i+3])
    end
    going_to = false
  end
  
  if going_to == false then global_error = true end

end
