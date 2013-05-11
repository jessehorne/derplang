function va(x,y) -- variable declaration
  if tonumber(y) ~= nil then
    _G[x] = tonumber(y)
  else
    _G[x] = y
  end
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

function fo(x, cmd, var, var2, var3) -- for loop
  print(x, cmd, var, var2, var3)
  for i=1, x-1 do
    _G[cmd](var, var2, var3)
  end
end

function ip(x) -- input
  _G[x] = io.read()
end

function go(x) -- GO
  going_to = true
  if tonumber(x) ~= nil then
    start_place = tonumber(x)
  else
    if _G[x] ~= nil then
      start_place = _G[x]
    else
      global_error = true
    end
  end
end

function con_check(x, y, j, k, sign)
  if tonumber(x) ~= nil then _G[x] = tonumber(x) end
  if tonumber(y) ~= nil then _G[y] = tonumber(y) end
  if sign == "=" then 
    if _G[x] == _G[y] then
      go(j)
    else
      go(k)
    end
  elseif sign == "<" then
    if _G[x] < _G[y] then
      go(j)
    else
      go(k)
    end
  elseif sign == ">" then
    if _G[x] > _G[y] then
      go(j)
    else
      go(k)
    end
  end
end

function ra(x, y, z) -- Random Number
  print(x, y, z)
  _G[x] = math.random(y, z)
end

