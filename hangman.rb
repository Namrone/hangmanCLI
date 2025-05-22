class Hangman
attr_accessor :guesses, :word

def initialize(guesses, new_word = true)
  @guesses = guesses
  @new_word = new_word
end

def pick_word
  word_list = Array.new
  File.open("google-10000-english-no-swears.txt", "r") do |file|
    file.each_line do |word|
      word_list << word if word.length >= 5 && word.length <= 12
  end
  word_list.sample
end

def char_in_word(char)
  word.include?(char)
end


end