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
     user_string.to_i
     
     
     #converts the user's input from the user-friendly format (on a 1-9 scale) to the array-friendly format (where the first index starts at 0)
      
      
      
    end
  
end