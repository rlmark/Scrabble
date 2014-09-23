class Scrabble
  @@all_words = {}

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
  end

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

  # Returns the word with the highest score
  def self.highest_score_from(array_of_words)
    array_of_words.each { |word| @@all_words[word] = score(word) }
    # puts "The all_words hash might be useful #{@@all_words}"
    if tie_checker
    else
      @@all_words.max_by{ |k,v| v }[0]
    end
  end

  # In the event of a tie, returns word with highest score in fewest tiles
  def self.tie_checker
    totals = @@all_words.values
    # puts "these are the key totals #{totals}"
    winner = totals.find_all { |v| v == totals.max }
    # puts "The max totals are #{winner}"
    if winner.length > 1
      winners = @@all_words.select { |word, total| total == winner[0] }
      # puts "the winning word is #{winners.keys.max}"
      return winners.keys.max
    end
  end
end


######### FOR TESTING PURPOSES #########

array = ["aaaaaaaaaaaa", "Yellow", "Hippo", "face", "a"]
Scrabble.highest_score_from(array)
Scrabble.tie_checker

puts "#{Scrabble.tie_checker}"









# Alternate idea: To avoid nested loops, create giant hash of values and just check if
# user's word is equal to a key in the hash. Then return value
#{"A" => 1, "E" => 1, "I" => 1, "O" => 1, "U" => 1, "L" => 1, "N" => 1, "R" => 1, "S" => 1, "T" => 1,}


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
