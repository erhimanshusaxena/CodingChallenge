require './lib/helper.rb'

class ChessBoard
  include Helper
  # features of the chess board
  # 8X8 boxes both white and black box equally divided
  # Has a pawn on the board(presumed to be on first box of the board)

  def initialize
    # Considering chess as 8X8 board
    # initializing pawn's position at initial value as 0,0
    @pawn = {
      x: 0,
      y: 0,
      f: nil,
      c: nil
    }
  end

  def get_new_box action, steps=1
    x, y, f, c = @pawn[:x], @pawn[:y], @pawn[:f], @pawn[:c]
    pos = left_position(f, x, y) if action == 'left'
    pos = right_position(f, x, y) if action == 'right'
    pos = forward_position(f, x, y, steps) if action == 'forward'
    pos
  end

  def set_position pos
    @pawn[:f] = pos[:f]
    @pawn[:c] = pos[:c]
    @pawn[:x] = pos[:x]
    @pawn[:y] = pos[:y]
    @pawn
  end

  def position
    puts "Pawn is at (#{@pawn[:x]}, #{@pawn[:y]}) facing #{@pawn[:f]} at #{@pawn[:c]} box"
  end

  def move_left
    pos = get_new_box('left')
    set_position pos if pos
  end

  def move_right
    pos = get_new_box('right')
    set_position pos if pos
  end

  def move_forward(steps)
    pos = get_new_box('forward', steps)
    set_position pos if pos
  end
end


# chess = ChessBoard.new

# puts "Making place mathod call"

# chess.place_in_box(1, 1, 'N', 'W')

# puts "making left move"

# chess.move_left

# puts "Print current status"

# chess.position

# puts "Making forward move"

# chess.move_forward

# puts "making right move"

# chess.move_right

# puts "Print current status"

# chess.position

# puts "Making forward move"

# chess.move_forward

# puts "Print current status"

# chess.position
