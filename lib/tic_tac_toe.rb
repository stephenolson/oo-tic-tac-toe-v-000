class TicTacToe
  
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
  
  
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
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
  
  def player_move(index, current_player)
    @board[index] = current_player
  end
  
  def position_taken?(location)
    @board[location] != " " && @board[location] != ""
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end
  
  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    
    if valid_move?(index) == true
      player_move(index, current_player)
      display_board
    else
      turn
    end
  end
  
  def turn_count
    counter = 0
    @board.each do |token|
    
    if token == "X" || token == "O"
      counter += 1
    end
  
  end
  
  counter

  end
  
  def current_player
    if turn_count % 2 == 0
      return "X"
    else
      return "O"
    end
  end
  
  def won?
    WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0] # returns index 0 of each element
    win_index_2 = win_combination[1] # returns index 1 of each element
    win_index_3 = win_combination[2] # returns index 2 of each element

    position_1 = board[win_index_1] # applies the index to the board, which is a position
    position_2 = board[win_index_2] # applies the index to the board, which is a position
    position_3 = board[win_index_3] # applies the index to the board, which is a position

    if position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 == "O" && position_3 == "O" # if index 0,1,2 (position 1,2,3) is all X or all O
      return win_combination

    else
      false
  end
  
  def full?
    @board.all? do |box|
    box == "X" || box == "O"
    end  
  end

  def draw?
    if full? == true && won? == false
      return true
    else
      return false
    end
  end

  def over?
    if won? || draw? || full?
      return true
    else
      return false
    end
  end
  
  def winner
    if won? && board[won?(board)[0]] == "X"
      return "X" # X is the winne
    elsif won? && board[won?(board)[0]] == "O"
      return "O" #O is the winne
    else
      nil
    end
  end

  def play
    until over?
      turn
    end
    if won?
      puts "Congratulations " + winner + "!"
    elsif draw? 
      puts "Cat's Game!"
    else
  end
  
  
  
  
  
end


