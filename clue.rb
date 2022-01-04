class Clue
  attr_reader :letter, :position, :color

  def initialize(letter:, position:, color:)
    @letter = letter
    @position = position
    @color = color
  end

  def green?
    color == :green
  end

  def yellow?
    color == :yellow
  end

  def to_s
    if green?
      letter.light_white.on_green
    elsif yellow?
      letter.light_white.on_yellow
    else
      letter.white
    end
  end

  def match?(word)
    if green?
      word[position] == letter
    elsif yellow?
      word.include?(letter) && word[position] != letter
    else
      !word.include?(letter)
    end
  end

  def self.from_guess(guess, answer)
    letters = guess.chars
    colors = letters.map.with_index do |letter, i|
      if answer[i] == letter
        :green
      elsif answer.include?(letter)
        :yellow
      else
        :black
      end
    end
    letters.zip(colors).map.with_index do |(letter, color), i|
      new(letter: letter, color: color, position: i)
    end
  end
end
