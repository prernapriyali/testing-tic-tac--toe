#!/usr/bin/env ruby

require_relative '../lib/player'
require_relative '../lib/board'
require_relative '../lib/game'

new_game = Game.new
new_game.display_instruction
abort if new_game.player_response == 'q'

loop do
  player1, player2 = new_game.player_name
  game_board = Board.new
  player1 = Player.new(player1, 'X')
  player2 = Player.new(player2, 'O')

  new_game.display_name_symbol(player1, player2)
  new_game.display_board(game_board.board)
  current_player = player1

  loop do
    puts "#{current_player.symbol} #{current_player.name}: "
    puts 'which position do you want to take?:'
    position = gets.chomp.to_i
    position = new_game.validate_position(position, game_board.board)
    game_board.update_board(current_player, position, player1, player2)

    break if new_game.game_status?(game_board, current_player)

    new_game.display_board(game_board.board)
    current_player = player1.switch_player(current_player, player2)
  end
  break if new_game.player_response == 'q'
end
