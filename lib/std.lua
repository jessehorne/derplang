function nu(x, y) -- Number Declaration 
  _G[x] = y
end

function st(x, y) -- String Declaration
  _G[x] = y
end

function ou(x) -- prints x
  if _G[x] ~= nil then
    print(_G[x])
  else
    print(x)
  end
end

function co(z, x, y) -- concatenates strings
  if _G[x] == nil then _G[x] = x end
  if _G[y] == nil then _G[y] = y end
  _G[z] = _G[x] .. _G[y]
end

function ad(z, x, y) -- Addition of numbers
  if _G[x] == nil then
    if tonumber(x) ~= nil then _G[x] = tonumber(x) end
  end
  if _G[y] == nil then
    if tonumber(y) ~= nil then _G[y] = tonumber(y) end
  end
  _G[z] = _G[x] + _G[y]
end

function su(z, x, y) -- subtraction of numbers
  if _G[x] == nil then
    if tonumber(x) ~= nil then _G[x] = tonumber(x) end
  end
  if _G[y] == nil then
    if tonumber(y) ~= nil then _G[y] = tonumber(y) end
  end
  _G[z] = _G[x] - _G[y]
end

function mu(z, x, y) -- multiplication
  if _G[x] == nil then
    if tonumber(x) ~= nil then _G[x] = tonumber(x) end
  end
  if _G[y] == nil then
    if tonumber(y) ~= nil then _G[y] = tonumber(y) end
  end
  _G[z] = _G[x] * _G[y]
end

function di(z, x, y) -- division
  if _G[x] == nil then
    if tonumber(x) ~= nil then _G[x] = tonumber(x) end
  end
  if _G[y] == nil then
    if tonumber(y) ~= nil then _G[y] = tonumber(y) end
  end
  _G[z] = _G[x] / _G[y]
end

function fo(x, cmd, var) -- for loop
  for i=1, x-1 do
    _G[cmd](var)
  end
end

function ip(x) -- input
  _G[x] = io.read()
end
