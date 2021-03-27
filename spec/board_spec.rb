require_relative 'spec_helper'
require_relative '../lib/board'
require_relative '../lib/player'

describe Board do
  let(:board) { Board.new }
  let(:player1) { Player.new('David', 'X') }
  let(:player2) { Player.new('Oyinda', 'O') }
  let(:active_player) { player1 }

  describe '#initialize' do
    it 'initializes the board' do
      expect(board.board).to eql([1, 2, 3, 4, 5, 6, 7, 8, 9])
    end
  end

  describe '#draw?' do
    it 'returns draw if the game is in a tie' do
      board.board = %w[X O X O X O O X O]
      expect(board.draw?).to eql(true)
    end

    it 'returns false if board array is not empty' do
      expect(board.draw?).to eql(false)
    end
  end

  describe '#win?' do
    it 'updates board base on the position active player picks' do
      board.board = [1, 2, 3, 'X', 'X', 'X', 7, 8, 9]
      expect(board.win?).to eql(true)
    end

    it 'returns false for faulty combination [1,4,9]' do
      board.board = [1, 2, 3, 4, 'O', 'X', 'X', 7, 8, 9]
      expect(board.win?).to eql(false)
    end
  end

  describe '#update_board' do
    it 'updates board base on the position active player chooses' do
      expect(board.update_board(active_player, 2, player1, player2)).to eql('X')
    end
  end
end
