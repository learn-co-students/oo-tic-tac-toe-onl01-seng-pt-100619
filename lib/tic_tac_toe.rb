require 'pry'

class TicTacToe
  attr_accessor :input
  def initialize
    @board = [" "," "," "," "," "," "," "," "," "]
  end
  
  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(input)
    input.to_i - 1
    # binding.pry
  end
  
  def move(index,token="X") #?
    @board[index] = token
    @board[4] = "O"
      # binding.pry
  end
  
  def position_taken?(index)
    @board[index] != " " 
  end
  
  def valid_move?(index) #?any other way to code? shorter way?
   if !position_taken?(index) && index<9
     true
   else
     false 
   end
  end
  
 def turn_count
   @board.count{|element| element != " "}
 end
 
 def current_player #Why should I know whether turn_count is even or odd? how would it help me choose whether the third round is X's turn and the 4th is O?
   if turn_count % 2 == 0 
     "X"
   else
     "O"
   end
  # binding.pry
 end
 
 def turn
   input = gets
   index = input_to_index(input)
    if valid_move?(index)
      move(index)
      current_player
      @board
    else
      input = gets
      index = input_to_index(input)
      move(index)
    end
   
  end
  
end