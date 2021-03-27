require_relative 'spec_helper'
require_relative '../lib/game'
require_relative '../lib/board'
require_relative '../lib/player'

describe Game do
  let(:new_game) { Game.new }
  let(:board) { Board.new }
  let(:player1) { Player.new('David', 'X') }
  let(:player2) { Player.new('Oyinda', 'O') }
  let(:active_player) { player1 }

  describe '#validate_name' do
    it 'checks if a name has been entered' do
      expect(new_game.validate_name('David')).to eql('David')
    end
  end

  describe '#validate_position' do
    it 'checks if the position taken is valid' do
      expect(new_game.validate_position(3, board.board)).to eql(3)
    end

    it 'returns false if the position taken is not valid' do
      expect(new_game.validate_position(9, board.board)).to eql(9)
    end
  end

  describe '#game_status' do
    it 'returns false if the game is neither a win nor a draw ' do
      expect(new_game.game_status?(board, active_player)).to eql(false)
    end

    it 'returns true if the game is neither a win nor a draw ' do
      expect(new_game.game_status?(board, active_player)).to_not eql(true)
    end
  end
end
