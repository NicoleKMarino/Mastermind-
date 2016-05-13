require "~/Documents/mod1/MMhard.rb"
require "~/Documents/mod1/MMsuper.rb"


def get_secret(difficulty)
  secret = case difficulty
  when "easy" then ["g","y","r","b"].shuffle
  when "hard" then ["g","y","r","b","p","r","p"].shuffle
  when "super" then ["g","y","r","b","p","r","p","a"].shuffle
  end
  return secret
end

def master_mind
  puts "Welcome to MASTERMIND. Would you like to play on (e)asy, play on (h)ard, or play on (s)uper hard. Read the (i)nstructions, or (q)uit?"
  userInput= gets.chomp.upcase
  case userInput
  when "E" then play_time(get_secret "easy")
  when "H" then play_hard(get_secret "hard")
  when "S" then play_super(get_secret "super")
  when "I"
    puts "I have generated a beginner sequence with four elements made up of: (r)ed, (g)reen, (b)lue, and (y)ellow. You have to guess what that sequence is. I will tell you when you are right and when you are wrong"
    master_mind
  when "Q" then puts "That's too bad, Goodbye"
  else
    puts "That's not an option."
    master_mind
  end
end

def play_time(secret)
  puts "I have generated a beginner sequence with four elements made up of:(r)ed,(g)reen,(b)lue,and (y)ellow. Use (q)uit at any time to end the game. What's your guess? (If you want to cheat, type C)"
  user_guess= gets.chars.to_a
  user_guess.each do |letter|
    if (letter=="C" or letter=="c")
      puts secret.join(",")
      play_time secret
    elsif (letter=="q" or letter=="Q")
      puts "That's too bad, goodbye"
      return
    else
     matches = Array.new
     misses = Array.new
     secret.each_with_index do |letter, index|
		     if(letter == user_guess[index])
		        matches.push(index)
         else
            misses.push(index)
          end
      end
    end
    if (misses.length==0)
      puts "Congratulations! You guessed the sequence #{secret}.Do you want to play again?Y/N"
      user_choice=gets.chomp.upcase
      if user_choice=="Y"
        play_time get_secret "easy"
      else
        puts "That's too bad,goodbye"
      end.play_time
    elsif (misses.length != 0)
      puts "You have #{matches.length} in the right place"
      puts "You have #{misses.length} in the wrong place"
      puts "I am going to start again, please stand by....."
      play_time secret
    else
      puts "test"
    end
  end
end
