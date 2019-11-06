class TicTacToe
  
  def initialize
    #sets the starting state of the board
    #an array with 9 " " empty strings
    #within an instance variable named @board
    
    @board = Array.new(9, " ")
  end
  
  WIN_COMBINATIONS = [
    #is a constant equal to a nested array 
    #filled with index values for the various winning combinations possible
    
    [0,1,2], #toprow
    [3,4,5], #middle
    [6,7,8],  #bottom
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
    if position.to_i.between?(0,8) && !position_taken?(position)
      true
      else 
        false
      end
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
    #ask for input again
      turn
    end
    end
    
    
end