class Board
  attr_accessor :moves, :board
  WIN_CASES = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]].freeze

  def initialize
    @board = Array.new(9, ' ')
    @moves = 0
  end

  def show
    3.times do |i|
      puts '    -------------'
      puts "    | #{@board[i * 3]} | #{@board[i * 3 + 1]} | #{@board[i * 3 + 2]} |"
    end
    puts '    -------------'
  end

  def make_move?(move, player)
    if valid_move?(move) & valid_position?(move)
      apply_move(move, player)
      increase_moves_counter
      return true
    end
    false
  end

  def valid_position?(move)
    @board[move - 1] == ' '
  end

  def valid_move?(move)
    move.between?(1, 9)
  end

  def win?
    return test_win if @moves > 4

    false
  end

  def draw?
    @moves == 9
  end

  def build
    3.times do
      animate '    -------------'
      print "\n"
      animate '    |   |   |   |'
      print "\n"
    end
    animate '    -------------'
    print "\n"
  end

  def apply_move(move, player)
    @board[move - 1] = player.letter
  end

  def increase_moves_counter
    @moves += 1
  end

  def test_win
    WIN_CASES.each do |c|
      return true if @board[c[0]] != ' ' && @board[c[0]] == @board[c[1]] && @board[c[0]] == @board[c[2]]
    end
    false
  end

  private

  def animate(str)
    str.to_s
    str.split('').each do |i|
      print i
      sleep(0.04)
    end
  end
end
