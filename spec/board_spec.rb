# frozen_string_literal: true

require_relative '../lib/board'
require_relative '../lib/player'

describe Board do
  subject(:table) { described_class.new }

  describe '#initialize' do
    # Initialize -> No test necessary
  end

  describe '#make_move?' do
    # Public Script Method -> No test necessary
  end

  describe '#valid_move?' do
    it 'sould return true when the move is between 1 & 9' do
      expect(table.valid_move?(5)).to be true
    end

    it 'sould return false when the move is bigger than 9' do
      expect(table.valid_move?(12)).to be false
    end

    it 'sould return false when the move is less than 1' do
      expect(table.valid_move?(0)).to be false
    end
  end

  describe '#valid_position?' do
    it 'sould return true when the board position with the index equal to move (-1) is a space' do
      table.board = ['X', 'O', 'X', 'O', 'X', ' ', 'X', 'O', 'X']
      expect(table.valid_position?(6)).to be true
    end

    it 'sould return false when the board position with the index equal to move (-1) is a not a space' do
      table.board = ['X', 'O', 'X', 'O', 'X', ' ', 'X', 'O', 'X']
      expect(table.valid_position?(3)).to be false
    end
  end

  describe '#apply_move' do
    let(:player) { instance_double(Player, { name: 'texas', letter: 'X' }) }

    it 'should  place the move of the player on the board' do
      expect { table.apply_move(3, player) }.to change { table.board[2] }.to('X')
    end
  end

  describe '#increase_moves_counter' do
    it 'should increment the moves by one when the method is called' do
      expect { table.increase_moves_counter }.to change { table.moves }.by(1)
    end
  end

  describe '#test_win' do
    let(:player) { instance_double(Player, { name: 'texas', letter: 'X' }) }
    let(:player2) { instance_double(Player, { name: 'arizona', letter: 'O' }) }

    it 'should return true if one of the win cases is available' do
      table.apply_move(1, player)
      table.apply_move(2, player2)
      table.apply_move(5, player)
      table.apply_move(3, player2)
      table.apply_move(9, player)
      expect(table.test_win).to be true
    end

    it 'should return false if none of the win cases is available' do
      table.apply_move(4, player)
      table.apply_move(2, player2)
      table.apply_move(5, player)
      table.apply_move(3, player2)
      table.apply_move(9, player)
      expect(table.test_win).to be false
    end
  end

  describe '#draw?' do
    it 'should return true when the moves are equal to 9' do
      table.moves = 9
      expect(table.draw?).to be true
    end

    it 'should return false when the moves are different than 9' do
      table.moves = 5
      expect(table.draw?).to be false
    end
  end
end
