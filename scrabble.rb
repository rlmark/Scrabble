class Scrabble
  attr_accessor

  # Creates hash of letters and corresponding values
  def self.values
    {
      ["A", "E", "I", "O", "U", "L", "N", "R", "S", "T"] => 1,
      ["D", "G"] => 2 ,
      ["B", "C", "M", "P"] => 3,
      ["F", "H", "V", "W", "Y"] => 4,
      ["K"] => 5,
      ["J", "X"] => 8,
      ["Q", "Z"] => 10
    }
    # Alternate idea: To avoid nested loops, create giant hash of values and just check if
    # user's word is equal to a key in the hash. Then return value
    #{"A" => 1, "E" => 1, "I" => 1, "O" => 1, "U" => 1, "L" => 1, "N" => 1, "R" => 1, "S" => 1, "T" => 1,}
  end

  # Do I really want to make these values dependent on instances? Not really. See above
  # def initialize
  #   @letter_val = {
  #     1 => ["A", "E", "I", "O", "U", "L", "N", "R", "S", "T"],
  #     2 => ["D", "G"],
  #     3 => ["B", "C", "M", "P"],
  #     4 => ["F", "H", "V", "W", "Y"],
  #     5 => ["K"],
  #     8 => ["J", "X"],
  #     10 => ["Q", "Z"]
  #   }
  # end

  # Returns scored value of user's word
    # Alternate idea: From giant hash,
    # hash.collect do |letter, value|
    #   if w.include? letter
    #     total += value
    # end


  # Returns the score of a given word
  def self.score(word)
    w = word.upcase.chars
    total = 0
    values.each do |letters, value|
      w.each do |user_letter|
        if letters.include? user_letter
          total += value
        end
      end
    end
    total
  end

  # Returns the word with the higest score
  def self.highest_score_from(array_of_words)
    best_word = {}
    array_of_words.each { |word| best_word[word] = score(word) }
    best_word.max_by{ |k,v| v }[0]
  end

  # In the event of a tie, returns word with highest score in fewest tiles
  def self.tie_checker(array_of_words)

  end

end
