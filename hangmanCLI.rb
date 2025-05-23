require_relative "hangman"

def print_hangman(wrong)
  case wrong
  when 0
    puts "|‾‾‾‾‾|"
    puts "|"
    puts "|"
    puts "|"
    puts "|"
    puts "|_____"
  when 1
    puts "|‾‾‾‾‾|"
    puts "|     O"
    puts "|"
    puts "|"
    puts "|"
    puts "|_____"
  when 2
    puts "|‾‾‾‾‾|"
    puts "|     O"
    puts "|     |"
    puts "|"
    puts "|"
    puts "|_____"
  when 3
    puts "|‾‾‾‾‾|"
    puts "|     O"
    puts "|    /|"
    puts "|"
    puts "|"
    puts "|_____"
  when 4
    puts "|‾‾‾‾‾|"
    puts "|     O"
    puts "|    /|\\"
    puts "|"
    puts "|"
    puts "|_____"
  when 5
    puts "|‾‾‾‾‾|"
    puts "|     O"
    puts "|    /|\\"
    puts "|    /"
    puts "|"
    puts "|_____"
  when 6
    puts "|‾‾‾‾‾|"
    puts "|     O"
    puts "|    /|\\"
    puts "|    / \\"
    puts "|"
    puts "|_____"
  end
end