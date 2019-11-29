require 'pry'
class TicTacToe
  
  def initialize
    #sets the starting state of the board
    #an array with 9 " " empty strings
    #within an instance variable named @board
    
    @board = Array.new(9, " ")
  end
  
  WIN_COMBINATIONS = [
    
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
    ]
    
    
    
    def display_board
      #prints the current board representation based on the @board instance variable
      
      puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
      puts "-----------"
      puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
      puts "-----------"
      puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end
    
    
    def input_to_index(user_string)
     #accepts the user's input (a string) as an argument
     #converts the user's input (a string) into an integer
     input = 0
     input = user_string.to_i
     
      #converts the user's input from the user-friendly format (on a 1-9 scale) to the array-friendly format (where the first index starts at 0)
      
      input - 1
    end
    
    
    def move(index, token = "X")
      #index: in the @board array that the player chose
      #token: the players token, either "X" or "O"
      
      # index[token]
      @board[index] = token
      
    end
    
    
    def position_taken?(position)
      #it is passed the index value for a prospective move
      #check if that position on the @board is vacant or if it contains X /O
      #If the position is free, the method should return false (i.e., "the position is not taken"); otherwise, it will return true.
      
      #returns true/false based on whether the position on the board is already occupied
      
      if @board[position] == " " || @board[position] == nil
        false
      else
        true
      end
    end
    
    
    def valid_move?(position)
      #returns true if the move is valid and false or nil if not
    position.to_i.between?(0,8) && !position_taken?(position)
      
    end
    
    
    def turn_count #counts occupied positions
    #returns number of turns that have been played
    #based on the board variable
    
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
        "X"
      else 
        "O"
      end
    end
    
    
    def turn
    # receives user input via the gets method
    # calls #input_to_index, #valid_move?, and #current_player
    # makes valid moves and displays the board
    # asks for input again after a failed validation
    
    
    puts "Please enter 1-9:"
    user_input = gets.strip
    index = input_to_index(user_input)
    
    #if index valid.. make a move for index.
    #show the board
    if valid_move?(index)
      move(index, current_player)
      display_board
    else 
      turn
    end
    end
    
    def won? 
      is_won = false 
      
      WIN_COMBINATIONS.any? do |combo| 
        
        if @board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X"
          is_won = combo
        elsif @board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O"
          is_won = combo 
        end
      end
      is_won
    end
    
    def full?
      @board.each do |token|
        if token == "X" || token == "O"
        else
          return false
        end
      end
    end
    
    def draw?
      @board.each do |token|
        if token == "X" || token == "O" && !won?
        else
          return false
        end
      end
    end
  
  def over?
    @board.each do |token|
        if won? || full?
        else
          return false
        end
      end
  end
  
  def winner
    if won?
      winning_combo = won?
      w = @board[winning_combo[0]]
      return w
    end
  nil
  end
  
    def play
      until over?
        turn
      end
      if won?
        puts "Congratulations #{winner}!"
      else
        puts "Cat's Game!"
      end
    end
end