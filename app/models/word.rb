class Word < ActiveRecord::Base
	
	validates_presence_of :text

	before_create :add_letters

	def add_letters
  		characters = self.text.chars
  		alphabetized_characters = characters.sort
  		self.letters = alphabetized_characters.join
  	end

	def self.find_anagrams(word)
	  word_array = word.chars.map(&:to_s)
	  reordered_words = word_array.permutation.map(&:join)
	  Word.where("text in (?)", reordered_words)
	end

end