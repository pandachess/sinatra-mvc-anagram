require 'sinatra'

get '/' do
  erb :index
end

get '/anagrams/:word' do
	@word = params[:word]
	word_array = @word.chars.sort
	alphabetized_string = word_array.join
	@anagrams = Word.where("letters=?", alphabetized_string)
	erb :show
end

post '/' do
	@word = params[:word]
	begin
		valid_input?(@word)
		redirect "/anagrams/#{@word}"
	rescue Exception => error
		@error = error.message
		erb :index
	end
end

def valid_input?(input)
	if input.length > 3
		raise Exception.new("Word must be less than or equal to 3 characters.")
	end
end

