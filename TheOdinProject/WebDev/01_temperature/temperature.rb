def ftoc temp
  c = ( temp -32.00 ) * 0.556
  return c.to_i
end

def ctof temp
  f = ( temp * 1.8) + 32.0
  f
end
