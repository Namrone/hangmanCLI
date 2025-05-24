require_relative "hangman"

def print_hangman(wrong)
  case wrong
  when 0
    puts "|‾‾‾‾‾|"
    puts "|"
    puts "|"
    puts "|"
    puts "|"
    puts "‾‾‾‾‾‾‾"
  when 1
    puts "|‾‾‾‾‾|"
    puts "|     O"
    puts "|"
    puts "|"
    puts "|"
    puts "‾‾‾‾‾‾‾"
  when 2
    puts "|‾‾‾‾‾|"
    puts "|     O"
    puts "|     |"
    puts "|"
    puts "|"
    puts "‾‾‾‾‾‾‾"
  when 3
    puts "|‾‾‾‾‾|"
    puts "|     O"
    puts "|    /|"
    puts "|"
    puts "|"
    puts "‾‾‾‾‾‾‾"
  when 4
    puts "|‾‾‾‾‾|"
    puts "|     O"
    puts "|    /|\\"
    puts "|"
    puts "|"
    puts "‾‾‾‾‾‾‾"
  when 5
    puts "|‾‾‾‾‾|"
    puts "|     O"
    puts "|    /|\\"
    puts "|    /"
    puts "|"
    puts "‾‾‾‾‾‾‾"
  when 6
    puts "|‾‾‾‾‾|"
    puts "|     O"
    puts "|    /|\\"
    puts "|    / \\"
    puts "|"
    puts "‾‾‾‾‾‾‾"
  end
end

def print_game(game) #<= Prints out game layout each round
  puts "====================="
  puts "||     HANGMAN      ||"
  puts "====================="
  puts "\nType 'save' to save progress\n"
  print_hangman(game.incorrect_guesses)
  game.correct_guesses.each {|letter| print letter.nil? ? "‾‾‾ | " : "#{letter} | "}
  print "\n\nGuessed letters: "
  game.guesses.each {|letter| print "|-#{letter}-| "}
end

def get_guess(game) # <= Gets player letter guess
  print "\n\nWhat is your next guess?: "
  game.guess_check(gets.chomp)
end

def game_intro # <= Prints intro options & loops until player chooses one of the 3 options
  loop do
    puts "1. Start new game"
    puts "2. Load previous game"
    puts "3. Exit"
    print "Welcome to Hangman. What would you like to do: "
    choice = gets.chomp.to_i
    return choice if choice >= 1 && choice <= 3
    puts "\n~~~~Invalid entry. Please enter a number between #1-3~~~~\n"
  end
end

def play_game
  start_choice = game_intro()

  case start_choice # <= creates object based on whether user wants to start new or load previous save
  when 1
    game = Hangman.new([],[],false)
  when 2
  when 3
    return
  end

  until game.end_game
    begin
      print_game(game)
      get_guess(game)
    rescue => e
      puts e
    end
  end
end

play_game()