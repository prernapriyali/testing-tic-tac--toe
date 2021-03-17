# frozen_string_literal: true

# this is a class that contains all the helpers methods
class Helpers
  def valid_move?(board, index)
    index.between?(0, 8) && !position_taken?(board, index)
  end

  def position_taken?(board, index)
    if (board[index] == ' ') || (board[index] == '') || board[index].nil?
      false
    else
      true
    end
  end

  def input_to_index(input)
    input.to_i - 1
  end
end