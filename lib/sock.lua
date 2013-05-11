socket = require("socket")

function sb(address, port) -- Bind to address and port ("*", 0) for example
  assert(socket.bind(address, port), "YOUR SOCKET BINDING DONE DERPED")
end

function ca() -- Server accept
  client = server:accept()
end

function ct(x) -- set client timeout
  client:settimeout(tonumber(x))
end

function cr(x) -- Stores all input into x
  _G[x] = client:receive()
end

function cs(x) -- sends x
  client:send(x .. "\n")
end

function cc() -- client close
  client:close()
end
