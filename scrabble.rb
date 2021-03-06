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
      w.each { |user_letter| (letters.include? user_letter) ? total+= value : nil}
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
    winner = totals.find_all { |v| v == totals.max }
    if winner.length > 1
      winners = hash_from_highest_score.select { |word, total| total == winner[0] }
      tie_breaker = winners.keys.sort_by { |word| word.length }
      if twice_tied(tie_breaker)
        winners.first[0]
      else
        return tie_breaker[-1]
      end
    else
      hash_from_highest_score.max_by{ |k,v| v }[0]
    end
  end

  # Checks if multiple words have the same value and length
  def self.twice_tied(tie_breaker)
    longest_word = tie_breaker.max_by { |word| word.length }
    multi_win = tie_breaker.find_all { |word| word.length == longest_word.length }
    if multi_win.length > 1
      true
    end
  end
end
