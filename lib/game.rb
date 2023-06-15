require './lib/chess_board.rb'

class Game
  GAME_INSTRUCTIONS = "
      ********* Welcome to the game  *********
    Ready to play?
    Please follow below commands to start.
    1. To place Pawn at x, y coordinates facing direction NORTH on a BLACK box use command
       PLACE X, Y, NORTH, BLACK
    2. To turn left
       LEFT
    3. To turn right
       RIGHT
    4. To move forward one box at a time
       MOVE
    5. To move forward one box x steps at a time
       MOVE X
    6. To seek current position
       REPORT
    7. To end game
       END
  "
  def initialize
    @game_start = false
    @chess = ChessBoard.new
  end

  def valid_command? input
    if input != nil
      x, y, f, c = input.split(',')
      if 8 > x&.to_i and x&.to_i >= 0 and
        8 > y&.to_i and y&.to_i >= 0 and
        ['NORTH','SOUTH','EAST','WEST'].include?(f&.strip) and
        ['BLACK' , 'WHITE'].include?(c&.strip)
        return true
      end
    end
    false
  end

  def start
    print GAME_INSTRUCTIONS
    while user_input = gets.chomp
      if !@game_start and user_input != 'END' and !user_input.include?('PLACE')
        puts "Please provide PLACE command with position and direction to start playing"
      else
        if user_input.include?('PLACE')
          sub_command = user_input[6..user_input.length]
          if valid_command? sub_command
            x, y, f, c = sub_command.split(',')
            pos = {x: x.to_i, y: y.to_i, f: f.strip, c: c.strip}
            @chess.set_position(pos)
            @game_start = true
          else
            puts "Please provide valid PLACE command with position and direction"
          end
        elsif user_input.include?('MOVE')
          steps = user_input.split(' ').last.to_i
          steps = 1 if steps == 0
          @chess.move_forward(steps.to_i)
        else
          case user_input
          when 'LEFT'
            @chess.move_left
          when 'RIGHT'
            @chess.move_right
          when 'REPORT'
            @chess.position
          when 'END'
            end_game
          else
            puts "Please try valid command!"
          end
        end
      end
    end
  end

  def end_game
    puts "Thank you for playing!"
    exit
  end

end
