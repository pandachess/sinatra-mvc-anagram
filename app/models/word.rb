class Word < ActiveRecord::Base

	def self.find_anagrams(word)
	  word_array = word.chars.map(&:to_s)
	  reordered_words = word_array.permutation.map(&:join)
	  Word.where("text in (?)", reordered_words)
	end

end