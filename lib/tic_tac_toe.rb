class TicTacToe

  def initialize
    @board = Array.new(9, " ")
  end

WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6]
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def move(index, value)
    @board[index] = value
  end

  def position_taken?(location)
    @board[location] != " " && @board[location] != ""
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn_count
    turn = 0
    @board.each do |position|
      if position == "X" || position == "O"
        turn += 1
      end
    end
    return turn
  end

  def current_player
    player = turn_count
    if player.even?
      return "X"
    else
      return "O"
    end
  end

  def turn(board)
    puts "Please enter 1-9:"
    user_input = gets.strip
    index = input_to_index(user_input)
    value = current_player(board)
    if !valid_move?(board, index)
      user_input = gets.strip
    else move(board, index, value)
    end
    display_board(board)
  end

end
