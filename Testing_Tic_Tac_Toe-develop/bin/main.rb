#!/usr/bin/env ruby

require_relative '../lib/board.rb'
require_relative '../lib/player.rb'

def instructions
  system('clear')
  puts "You will have a 3x3 board and player 1 will have the first turn\n"
  puts "When it's your turn enter the number of the square that you want to play (between 1 and 9)"
  puts "Don't choose squares that are already occupied\n\n"
  puts '    -------------'
  puts '    | 1 | 2 | 3 |'
  puts '    -------------'
  puts '    | 4 | 5 | 6 |'
  puts '    -------------'
  puts '    | 7 | 8 | 9 |'
  puts '    -------------'
  puts "\nThe winner is the first one to form a line with 3 symbols vertically, horizontally or diagonally\n\n"
  puts 'Press Enter to continue'
  gets.chomp
end

system('clear')
puts 'Welcome to Tic-Tac-Toe by Aymen and Patrick'

puts 'Player 1, please enter your name:'
player1 = Player.new(gets.chomp, 'X')
puts "Hello, #{player1.name}, you are '#{player1.letter}'\n\n"

puts 'Player 2, please enter your name:'
player2 = Player.new(gets.chomp, 'O')
puts "Hello, #{player2.name}, you are '#{player2.letter}'\n\n"

puts "Enter 'y' if you want to see the instructions (Press enter to continue)"
instructions if gets.chomp.downcase == 'y'
system('clear')

b = Board.new
puts 'Building your board...'

winner = false
b.build
loop do
  puts "\n#{player1.name}, it's your move\n"
  puts 'invalid move! please enter a number between 1 and 9' until b.make_move?(gets.chomp.to_i, player1)
  system('clear')
  puts "\n"
  b.show
  if b.win?
    winner = player1.name
    break
  elsif b.draw?
    break
  end
  puts "\n#{player2.name}, it's your move\n"
  puts 'invalid move! please enter a number between 1 and 9' until b.make_move?(gets.chomp.to_i, player2)
  system('clear')
  puts "\n"
  b.show
  if b.win?
    winner = player2.name
    break
  elsif b.draw?
    break
  end
end

puts winner ? "\nCongratulations #{winner}!" : "\nIt's a draw, nobody won!"
puts "Thank you for playing !\n\n\n\n"
puts 'Sleeping...'
sleep(3)
puts 'Good night!'
