## ruby interpreter created by Iso, Jesse doesn't maintain this.

class Derp
  def initialize src
    @src = src.strip.split(':').map &:strip
    @pp, @vt = 1, {} # "part" pointer and variable table
    @src.unshift nil # offset for parity with Lua's 1-based indexing
  end

  # Return a variable's value if it exists, otherwise just the argument.
  def lu v
    @vt[v] || v
  end

  def va x, y
    @vt[x] = lu y
  end

  def ou x
    puts lu x
  end

  def co z, x, y
    @vt[z] = "#{lu x}#{lu y}"
  end

  def ip x
    @vt[x] = STDIN.gets.chomp rescue exit # EOF
  end

  def go x
    @pp = lu(x).to_i
  end

  def it x, y, a, b
    @pp = lu(lu(x).to_s == lu(y).to_s ? a : b).to_i
  end

  def ra z, x, y
    @vt[z] = rand lu(x).to_i..lu(y).to_i
  end

  Hash[*%w[ad + su - mu * di / mo % po **]].each do |cmd, op|
    define_method(cmd) do |z, x, y|
      @vt[z] = lu(x).to_i.send op, lu(y).to_i
    end
  end

  def run
    while @pp < @src.size
      n = @src[@pp] == 'fo' ? lu(@src[(@pp += 2) - 1]).to_i : 1

      cmd  = method @src[@pp]
      args = @src[(@pp += 1)...(@pp += cmd.arity)]
      n.times { cmd[*args] }
    end
  end
end

Derp.new(ARGF.read).run
