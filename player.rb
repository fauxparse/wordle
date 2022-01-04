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
    result.each(&method(:record))
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

  def record(clue)
    return if clue.yellow? && knowledge.any? { |k| k.green? && k.letter == clue.letter }

    knowledge << clue
  end

  def interactive
    loop do
      candidate = candidates[0, 20].sample
      puts "Try #{candidate}?"
      result = gets.chomp
      break if result == '+++++'

      candidate
        .chars
        .zip(result.chars, (0..4).to_a)
        .map(&:join)
        .map(&Clue.method(:decode))
        .each(&method(:record))
    end
  end
end
