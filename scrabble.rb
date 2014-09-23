class Scrabble

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
    all_words = {}
    array_of_words.each { |word| all_words[word] = score(word) }
    tie_checker(all_words)
  end

  # In the event of a tie, returns word with highest score in fewest tiles
  def self.tie_checker(hash_from_highest_score)
    totals = hash_from_highest_score.values
            #puts "these are the totals as values #{totals}"
    winner = totals.find_all { |v| v == totals.max }
            #puts "The max totals are #{winner}"
    if winner.length > 1
      winners = hash_from_highest_score.select { |word, total| total == winner[0] }
              puts "The value of winners is #{winners}"
      tie_breaker = winners.keys.sort_by { |word| word.length }
              puts "tie_breaker is #{tie_breaker}"
              puts "tie_breaker should be longest #{tie_breaker[-1]}"
      if twice_tied(tie_breaker, winners)
        twice_tied(tie_breaker, winners)
      else
        return tie_breaker[-1]
      end
    else
      hash_from_highest_score.max_by{ |k,v| v }[0]
    end
  end

  def self.twice_tied(tie_breaker, winners)
    longest_word = tie_breaker.max_by {|word| word.length}
    multi =  tie_breaker.find_all {|word| word.length == longest_word.length }
    if multi.length > 1
      puts "There are two possible winners, now find the first one"
      puts "this should be the first winning word #{winners.first[0]}"
      return winners.first[0]
    end
  end
end


######### FOR TESTING PURPOSES #########

#array = ["aaaaaatttttt","Ssaaaaaaaaaa", "Yellow", "Aaaaaaaaaaaa", "Hippo", "face", "a"]
#puts Scrabble.highest_score_from(array)










######### CONTENT GRAVEYARD #########

# IN FUTURE: Make this into a new function, for now, just make things work
# def create_hash(array_of_words)
#   all_words = {}
#   array_of_words.each { |word| all_words[word] = score(word) }
#   return all_words
# end

# def twice_tied(winners)
#   if winners.keys.find_all {|word| word.length}.length > 1
#     puts "There is more than one winner"
#   end
# Create a function to be embedded within if statement of tie_checker
# which looks at the order of the @@all_words array and puts in the first one.

# Alternate idea: To avoid nested loops, create giant hash of values and just check if
# user's word is equal to a key in the hash. Then return value
#{
#"A" => 1, "E" => 1,
#"I" => 1, "O" => 1,
#"U" => 1, "L" => 1,
#"N" => 1, "R" => 1,
#"S" => 1, "T" => 1,
#}

# Returns scored value of user's word
  # Alternate idea: From giant hash,
  # hash.collect do |letter, value|
  #   if w.include? letter
  #     total += value
  # end
