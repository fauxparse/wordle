class Game
  attr_reader :dictionary

  def initialize(dictionary)
    @dictionary = dictionary
    @word = dictionary.sample
  end

  def guess(guessed)
    Clue.from_guess(guessed, @word)
  end
end
