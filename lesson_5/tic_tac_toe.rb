require 'pry'

# Board
class Board
  WINNING_COMBOS = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # horizontals
                   [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # verticals
                   [[1, 5, 9], [3, 5, 7]]              # diagonals

  attr_accessor :positions

  def initialize
    setup_positions
  end

  def setup_positions
    @positions = {}

    (1..9).each { |n| @positions[n] = ' ' }
  end

  # rubocop:disable Metrics/AbcSize
  def render
    puts " #{positions[1]} | #{positions[2]} | #{positions[3]} "
    puts '-----------'
    puts " #{positions[4]} | #{positions[5]} | #{positions[6]} "
    puts '-----------'
    puts " #{positions[7]} | #{positions[8]} | #{positions[9]} "
  end
  # rubocop:enable Metrics/AbcSize

  def clear
    setup_positions
  end

  def positions_not_taken
    positions.select { |_, pos| pos == ' ' }.keys
  end

  def position_taken?(position)
    positions[position] != ' '
  end

  def update_position_value(index, value)
    positions[index] = value
  end

  def full?
    positions.count { |_, pos| pos == ' ' } == 0
  end

  def three_markers_in_a_row?(line)
    line.count(Game::HUMAN_MARKER) == 3 ||
      line.count(Game::COMPUTER_MARKER) == 3
  end

  def winning_marker
    WINNING_COMBOS.each do |line|
      current_line = positions.values_at(*line)

      return current_line[0] if three_markers_in_a_row?(current_line)
    end
  end
end

# Player
class Player
  attr_accessor :game_wins, :name, :choice, :marker

  def initialize
    @choice = nil
  end

  def add_game_win
    @game_wins += 1
  end

  def reset_score
    @game_wins = 0
  end
end

# Human
class Human < Player
  def initialize(marker)
    set_name
    @marker = marker
    @game_wins = 0
  end

  def set_name
    puts 'Please enter a name:'
    @name = gets.chomp
  end

  def place_a_marker(board)
    puts 'Please choose a position on the board (1 - 9):'
    choice = nil

    loop do
      choice = gets.chomp.to_i

      break unless board.position_taken?(choice)
      puts 'Sorry thats not a valid choice'
    end

    board.update_position_value(choice, @marker)
  end
end

# Computer
class Computer < Player
  NAMES = ['R2D2', 'C3PO', 'Darth Vader', 'Chewbacca', 'Kylo Ren', 'Rey']

  def initialize(marker)
    @name = NAMES.sample
    @marker = marker
    @game_wins = 0
  end

  def place_a_marker(board)
    # Defense
    computers_strategic_position(board, 'defense')

    # Offense
    computers_strategic_position(board, 'offense')

    unless @choice
      # choose middle square if it is empty before choosing random position
      @choice = board.positions[5] == ' ' ? 5 : board.positions_not_taken.sample
    end

    board.update_position_value(@choice, @marker)
  end

  def computers_strategic_position(board, strategy)
    marker = strategy == 'defense' ? marker : Game::HUMAN_MARKER
    index = nil

    Board::WINNING_COMBOS.each do |line|
      index = find_at_risk_square(line, board, marker)
      break if index
    end

    @choice = index
  end

  def find_at_risk_square(line, board, marker)
    position = nil

    if line.count { |index| board.positions[index] == marker } == 2
      position = line.find { |index| board.positions[index] == ' ' }
    end

    position
  end
end

# Game
class Game
  HUMAN_MARKER = 'x'
  COMPUTER_MARKER = 'o'
  ROUND_WIN_MAX = 3

  attr_reader :human, :computer, :board

  def initialize
    @human = Human.new(HUMAN_MARKER)
    @computer = Computer.new(COMPUTER_MARKER)
    @board = Board.new
    @current_player = @human
    @winner = nil
  end

  def run
    loop do
      loop do
        display_welcome_message
        display_board_and_current_scores
        place_piece_and_alternate_players

        break if board.full? || round_winner?
      end

      display_round_winning_board_and_winner
      reset

      reset_player_scores if game_winner?

      break if play_again?
    end

    display_goodbye_message
  end

  private

  def reset
    @current_player = human
    @winner = nil
    board.clear
  end

  def display_round_winning_board_and_winner
    system('clear')
    board.render
    display_round_winner_and_add_game_win
    puts "=> #{@winner.name} WINS THE GAME!" if game_winner?
    sleep(1)
  end

  def play_again?
    puts '=> Would you like to play again?(y/n)'
    if game_winner?
      gets.chomp.start_with?('n')
    else
      false
    end
  end

  def display_board_and_current_scores
    display_scores
    board.render
  end

  def reset_player_scores
    human.reset_score
    computer.reset_score
  end

  def display_welcome_message
    system('clear')

    puts "#{human.name}, Welcome to Tic Tac Toe!\n" \
         "First to win #{ROUND_WIN_MAX} games wins =>"
  end

  def display_goodbye_message
    puts 'Thank you for playing!!'
  end

  def display_scores
    puts "#{human.name}: #{human.game_wins}"
    puts "#{computer.name}: #{computer.game_wins}"
  end

  def place_piece_and_alternate_players
    @current_player.place_a_marker(board)

    @current_player = @current_player.class == Computer ? human : computer
  end

  def round_winner? # => returns 'x', 'o' or nil
    winning_marker = board.winning_marker

    if winning_marker == human.marker
      @winner = human
    elsif winning_marker == computer.marker
      @winner = computer
    end
  end

  def display_round_winner_and_add_game_win
    if @winner
      puts "=> #{@winner.name} WINS THE ROUND!"
      @winner.add_game_win
    else
      puts '=> IT\'S A TIE!'
    end
  end

  def game_winner?
    human.game_wins == ROUND_WIN_MAX || computer.game_wins == ROUND_WIN_MAX
  end
end

Game.new.run
