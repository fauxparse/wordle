class Dictionary
  include Enumerable

  # from https://www3.nd.edu/~busiforc/handouts/cryptography/letterfrequencies.html
  LETTER_SCORES = {
    'E' => 56.88,
    'A' => 43.31,
    'R' => 38.64,
    'I' => 38.45,
    'O' => 36.51,
    'T' => 35.43,
    'N' => 33.92,
    'S' => 29.23,
    'L' => 27.98,
    'C' => 23.13,
    'U' => 18.51,
    'D' => 17.25,
    'P' => 16.14,
    'M' => 15.36,
    'H' => 15.31,
    'G' => 12.59,
    'B' => 10.56,
    'F' => 9.24,
    'Y' => 9.06,
    'W' => 6.57,
    'K' => 5.61,
    'V' => 5.13,
    'X' => 1.48,
    'Z' => 1.39,
    'J' => 1.0,
    'Q' => 1.0
  }.freeze

  def initialize
    @words = File.readlines('words.txt').map(&:chomp).reject(&:empty?)
  end

  def sample
    @words.sample
  end

  def each(&block)
    if block_given?
      @words.each(&block)
    else
      to_enum(:each)
    end
  end

  def score(word)
    word.chars.map { |c| LETTER_SCORES[c] }.reduce(:*)
  end
end
