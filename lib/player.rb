# frozen_string_literal: true

class Player
  attr_reader :name, :letter

  def initialize(name, letter)
    @name = name
    @letter = letter
  end
end
