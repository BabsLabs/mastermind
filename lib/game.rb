class Game

  def start_game
    puts "Welcome to MASTERMIND\nWould you like to (p)lay, read the (i)nstructions, or (q)uit?"
    # get user input to play or quit
    @user_input = ''
    # check for valid input and continue based of that
    until @user_input == 'p' || @user_input == 'q' || @user_input == 'i'
      @user_input = gets.chomp.downcase
      if @user_input =='i'
        puts 'You requested instructions on how to play MASTERMIND. To win at MASTERMIND you need to correctly guess a sequence of four different colors.'
        self.start_game
      elsif @user_input == 'q'
        puts 'MASTERMIND aborted'
        exit
      elsif @user_input == 'p'
          self.play_game
      else
        puts 'Invalid response. Enter valid response'
      end
    end
  end

  def play_game
    # prompt user for moves
    puts "I have generated a beginner sequence with four elements made up of:\n(r)ed, (g)reen, (b)lue, and (y)ellow.\nUse (q)uit at any time to end the game.\nWhat's your guess?"
    #generate the correct answer
    @secret_sequence = generate_array_of_colors
    # get user move input and give error if incorrect input is given
    @user_input = ''
    @user_input = gets.chomp.downcase

    until @user_input == @secret_sequence || @user_input == 'c' || @user_input == 'cheat'
      # if user chooses to cheat
      if @user_input == 'c' || @user_input == 'cheat'
        puts "You cheater! Here is the secret sequence [#{@secret_sequence}]"
        exit
      # if user chooses to quit
      elsif @user_input == 'q' || @user_input == 'quit'
        puts 'MASTERMIND aborted'
        exit
      # check input length for too short
      elsif @user_input.length < 4
        puts 'Input too short'
        @user_input = gets.chomp.downcase
      # check input length for too long
      elsif @user_input.length > 4
        puts 'Input too long'
        @user_input = gets.chomp.downcase
      elsif @user_input == @secret_sequence
        end_game
      else
        check_turn
        @user_input = gets.chomp.downcase
      end
    end
  end

  def generate_array_of_colors
    board = []
    4.times {
      number = rand 3
      if number == 0
        board << 'r'
      elsif number == 1
        board << 'b'
      elsif number == 2
        board << 'g'
      elsif number == 3
        board << 'y'
      end
    }
    board.join
  end

  def end_game
    # change this to the actual endgame if there is time.
    puts 'ENDGAME!!!!!! YOU WINNNNNNN!!!!!'
    exit
  end

  def check_turn
    guess_count = 0
    number_correct = 0
    single_guess_letters = @user_input.scan /\w/
    single_secret_letters = @secret_sequence.scan /\w/
    single_guess_letters.each do |guess_letter|
      single_secret_letters.each do |secret_letter|
        if guess_letter == secret_letter
          number_correct += 0.25
        end
      end
    end
    guess_count += 1
    puts "#{@user_input} has #{number_correct} of the correct elements. You have taken #{guess_count} guesses."
    puts "#{@secret_sequence}"
  end

end