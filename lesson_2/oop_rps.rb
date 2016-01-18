#
# OO Rock Paper Scissors
#
class Hand
  VALUES = %w(rock paper scissors)
  attr_reader :value

  def initialize(value)
    @value = value
  end

  def rock?
    @value == 'rock'
  end

  def paper?
    @value == 'paper'
  end

  def scissors?
    @value == 'scissors'
  end

  def >(other_move)
    if rock?
      (other_move.scissors?) ? true : false
    elsif paper?
      (other_move.rock?) ? true : false
    else
      (other_move.paper?) ? true : false
    end
  end

  def <(other_move)
    if rock?
      (other_move.paper?) ? true : false
    elsif paper?
      (other_move.scissors?) ? true : false
    else
      (other_move.rock?) ? true : false
    end
  end
end

class Player
  COMPUTER_NAMES = ['R2D2', 'Hal9000', 'C3PO']
  attr_accessor :choice, :name

  def initialize
    set_name
  end
end

class Human < Player
  def set_name
    name = nil

    loop do
      puts "What is your name?"
      name = gets.chomp
      break unless name.empty?
      puts "Please enter a name."
    end

    self.name = name
  end

  def choose
    choice = nil

    loop do
      puts "Please pick one: Rock Paper Scissors:"
      choice = gets.chomp.downcase
      break if Hand::VALUES.include?(choice)
      puts "Invalid entry."
    end

    self.choice = Hand.new(choice)
  end
end

class Computer < Player
  def set_name
    self.name = COMPUTER_NAMES.sample
  end

  def choose
    self.choice = Hand.new(Hand::VALUES.sample)
  end
end

class RPSGame
  attr_reader :human, :computer

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def win?(choice1, choice2)
    (choice1 == "paper" && choice2 == "rock") ||
      (choice1 == "rock" && choice2 == "scissors") ||
      (choice1 == "scissors" && choice2 == "paper")
  end

  def display_moves
    puts "#{human.name} chose #{human.choice.value}"
    puts "#{computer.name} chose #{computer.choice.value}"
  end

  def display_winner
    if human.choice > computer.choice
      puts "#{human.name} Wins!"
    elsif human.choice < computer.choice
      puts "#{computer.name} Wins!"
    else
      puts "It's a tie!"
    end
  end

  def display_welcome_message
    puts "Hello #{human.name} Welcome to Rock, Paper, Scissors!\n" \
         "you have begun a battle with #{computer.name}!"
  end

  def display_goodbye_message
    puts "Thank you for playing!"
  end

  def play_again?
    puts "#{human.name} Would you like to play again?(y/n)"
    gets.chomp.downcase.start_with?('y')
  end

  def play
    display_welcome_message

    loop do
      human.choose
      computer.choose
      display_moves
      display_winner

      break unless play_again?
    end

    display_goodbye_message
  end
end

RPSGame.new.play
