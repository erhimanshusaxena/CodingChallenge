module Helper
  def box_color x, y
    if (x + y) % 2 == 0
      c = 'BLACK'
    else
      c = 'WHITE'
    end
    c
  end

  def forward_position f, x, y, steps
    case f
    when 'NORTH'
      if y < 7 and (y + steps <= 7)
        y = y + steps
      end
    when 'WEST'
      if x > 0 and (x - steps >= 0)
        x = x - steps
      end
    when 'SOUTH'
      if y > 0 and (y - steps >= 0)
        y = y - steps
      end
    when 'EAST'
      if x < 7 and (x + steps <= 7)
        x = x + steps
      end
    end
    c = box_color(x, y)
    {f: f, c: c, x: x, y: y}
  end

  def left_position f, x, y
    case f
    when 'NORTH'
      f = 'WEST'
    when 'WEST'
      f = 'SOUTH'
    when 'SOUTH'
      f = 'EAST'
    when 'EAST'
      f = 'NORTH'
    end
    c = box_color(x, y)
    {f: f, c: c, x: x, y: y}
  end

  def right_position f, x, y
    case f
    when 'NORTH'
      f = 'EAST'
    when 'WEST'
      f = 'NORTH'
    when 'SOUTH'
      f = 'WEST'
    when 'EAST'
      f = 'SOUTH'
    end
    c = box_color(x, y)
    {f: f, c: c, x: x, y: y}
  end
end