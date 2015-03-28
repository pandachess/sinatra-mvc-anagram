class Word < ActiveRecord::Base

	def self.find_anagram(word)
	  word_array = word.chars.map(&:to_s)
	  reordered_words = word_array.permutation.map(&:join)
	  return reordered_words
	end

end