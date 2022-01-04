class Player
  attr_reader :game, :knowledge

  def initialize(game)
    @game = game
    @knowledge = Set.new
  end

  def guess
    # give a bit of variety so it's not always guessing the same word
    result = game.guess(candidates[0, 20].sample)
    puts result.map(&:to_s).join
    result.each { |clue| knowledge << clue }
  end

  def candidates
    game
      .dictionary
      .select { |word| knowledge.all? { |clue| clue.match?(word) } }
      .sort_by { |word| -game.dictionary.score(word) }
  end

  def play
    loop do
      result = guess
      break if result.all?(&:green?)
    end
  end
end
