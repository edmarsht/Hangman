class Hangman
  DICTIONARY = ["cat", "pizza", "computer", "house", "home", "phone", "bike", "queen",]
  
  def self.random_word
    DICTIONARY.sample
  end
 # PART 1 ---------------------------------------------------------
  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length, '_')
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def guess_word
    @guess_word
  end

  def attempted_chars
    @attempted_chars
  end

  def remaining_incorrect_guesses
    @remaining_incorrect_guesses
  end

  def already_attempted?(char)
    @attempted_chars.include?(char) 
  end

  def get_matching_indices(char)
    indice = []
    @secret_word.each_char.with_index do |ele, idx|
      if char == ele 
        indice << idx
      end
    end
    indice
  end

  def fill_indices(char, indice)
    indice.each do |ele|
    @guess_word[ele] = char
    end
  end


    # PART 2 --------------------------------------------------------


  def try_guess(char)
    if self.already_attempted?(char)
      puts 'that has already been attempted' 
      return false
    end

    @attempted_chars << char 
   
    match = self.get_matching_indices(char)
    self.fill_indices(char, match)

    @remaining_incorrect_guesses -= 1 if match.empty?

    true
  end
  
  def ask_user_for_guess
    puts 'Enter a char:'
    self.try_guess(gets.chomp)
  end

  def win? 
    if @guess_word.join == @secret_word
      puts 'WIN'
      return true 
    else
      false
    end
  end

  def lose? 
    if @remaining_incorrect_guesses == 0
      puts 'LOSE'
      true
    else
      false
    end
  end 

  def game_over?
    if win? || lose?
      puts @secret_word
      return true
    end
    false 
  end





end


