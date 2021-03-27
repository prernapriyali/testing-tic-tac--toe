require 'spec_helper'
require_relative '../lib/player'

describe Player do
  let(:player1) { Player.new('David', 'O') }
  let(:player2) { Player.new('Oyinda', 'X') }
  let(:active_player) { player1 }

  describe '#initialize' do
    it 'used to create new player objects' do
      expect(player1.name).to eql('David')
    end
  end

  describe '#switch_player' do
    it 'switches player' do
      expect(player1.switch_player(active_player, player2)).to eql(player2)
    end
  end
end
