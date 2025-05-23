class Hangman
  attr_accessor :correct_guesses, :incorrect_guesses,:word

  def initialize(correct_guesses, incorrect_guesses = [], word = false)
    self.word = word
    self.correct_guesses = correct_guesses
    @incorrect_guesses = incorrect_guesses
  end

  def word=(input) # <= sets the word to a random wordfrom word list or from saved file
    if input
    else
      word_list = Array.new
      File.open("google-10000-english-no-swears.txt", "r") do |file|
        file.each_line do |word_sample|
          word_list << word_sample.chomp if word_sample.length >= 5 && word_sample.length <= 12
        end
      end
      @word = word_list.sample
    end
  end

  def correct_guesses=(input) # <= sets correct guess length to either new word or the saved amount
    if @correct_guesses == nil
      @correct_guesses = Array.new(@word.length)
    else
      @correct_guesses = input
    end
  end

  def guess_check(char) # <= checks if guess has been guessed already & valid then sets it into correct variable
    char = char.downcase
    if @correct_guesses.include?(char) || @incorrect_guesses.include?(char)
      puts "You have already guessed '#{char}'. Please enter a different char"
      return
    end
    if !char.match?(/[[:alpha:]]/) || char.length > 1
      puts "Invalid: Please enter a letter"
      return
    end
    if @word.include?(char) 
      @correct_guesses[@word.index(char)] = char
    else
      @incorrect_guesses << char
    end
  end

  def end_game
     if @correct_guesses.to_s == @word
       puts "You win!"
     elsif @incorrect_guesses.length == 6
        puts "You lose, the word was #{@word}"
     end
  end
end