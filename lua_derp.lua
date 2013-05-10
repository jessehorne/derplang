require("lib.std")
function string:split(sep) -- string split function
  local sep, fields = sep or " ", {}
  local pattern = string.format("([^%s]+)", sep)
  self:gsub(pattern, function(c) fields[#fields+1] = c end)
  return fields
end
function trim(s)
  return (s:gsub("\n", ""))
end
file = assert(io.open(arg[1]), "[DERP]: You derped loading your file.") -- loads file
file_txt = file:read("*all") -- creates a string containing the derp script
file:close() -- closes file
t = file_txt:split(":") -- Splits string into table
global_error = false -- global for determining if an error interupts the loop
local t_length = 0 -- Declares script length as 0
for i,v in ipairs(t) do -- Declares script length
  t[i] = trim(t[i])
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
      if _G[t[i+1]] == nil then
        if tonumber(t[i+1]) ~= nil then _G[t[i+1]] = tonumber(t[i+1]) end
      end
      if _G[t[i+2]] == nil then
        if tonumber(t[i+2]) ~= nil then _G[t[i+2]] = tonumber(t[i+2]) end
      end
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

