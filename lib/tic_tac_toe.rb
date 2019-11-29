# require 'pry'

# class TicTacToe
#   attr_accessor :input
#   def initialize
#     @board = [" "," "," "," "," "," "," "," "," "]
#   end
  
#   WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]
  
#   def display_board
#     puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
#     puts "-----------"
#     puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
#     puts "-----------"
#     puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
#   end
  
#   def input_to_index(input)
#     puts "please provide the position by choosing a number between 1 to 9. "
#     input.to_i-1
#   end
  
#   def move(index,token="X")
#     @board[index] = token
#   end
  
#   def position_taken?(index)
#     @board[index] != " " 
#   end
  
#   def valid_move?(index) #valid if the index(position) is within 0 to 8 and it is in fact, being empty to place your game on. 
#     index.between?(0, 8) && !position_taken?(index) #if input_to_index is between 0 to 8 AND position is empty
#   end

  
# def turn_count
#   @board.count{|element| element != " "}
# end
 
# def current_player
#   #this method help us to know whether our player is X or Y 
#   if turn_count % 2 == 0 
#     "X"
#   else
#     "O"
#   end
#   # binding.pry
# end
 
#   def turn
#     user_input = gets.strip
#     index = input_to_index(user_input)
#     # binding.pry
#       if valid_move?(index)
#         move(index, current_player)
#         display_board
#         # binding.pry
#       else
#         turn #call itself within its own context to run the same operation as above 
#         move(index, current_player)
#       end
#   end
  
#   def won?
#     WIN_COMBINATIONS.each {|win_combo|
#       index_0 = win_combo[0]
#       index_1 = win_combo[1]
#       index_2 = win_combo[2]
  
#       position_1 = @board[index_0]
#       position_2 = @board[index_1]
#       position_3 = @board[index_2]
    

#     if position_1 == "X" && position_2 == "X" && position_3 == "X"
#       return win_combo
#     elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
#       return win_combo
#     end
#     }
#     return false
#   end
  
  
#   def full?
#     @board.all? {|index| index == "X" || index == "O"}
#   end
  
#   def draw?
#     full? && !won?
#   end
  
#   def over?
#     if full? || won?
#       true
#     else
#       false
#     end
#   end
    
    
#   def winner
#     index = []
#     index = won?
#     if index == false
#       return nil
#     else
#       if @board[index[0]] == "X"
#         return "X"
#       else
#         return "O"
#       end
#     end
#   end
  
  
#   def play
#     while !over?
#       if draw?
#         puts "it's the cat game!"
#         turn
#       elsif won?
#         puts "Congratulation #{winner}!"
#       end
#     end
#   end
       
# end

require 'pry'
class TicTacToe
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
  
     def initialize(board = nil)
      @board = board || Array.new(9, " ")
     end
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
     def move(index, token = "X")
       @board[index] = token
     end
     def position_taken?(index)
       @board[index] != " "
     end
     def valid_move?(index)
       @board[index] == " " && index.between?(0, 8)
     end
    def turn
      puts "Please select a number one through nine"
      input = gets.strip
      index = input_to_index(input)
      if valid_move?(index)
        token = current_player
        move(index, token)
      else
        turn
      end
      display_board
    end
    def turn_count
    @board.count{|token| token == "X" || token == "O"}
    end
    def current_player
    turn_count % 2 == 0 ? "X" : "O"
    end
    def won?
      WIN_COMBINATIONS.any? do |combo|
  
      if @board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X"
        return combo
      elsif @board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O"
        return combo
      end
    end
  end
    def full?
      @board.all? {|token| token == "X" || token == "O"}
    end
    def draw?
       @board.all? {|token| token == "X" || token == "O"} && !won?
  end
  def over?
    won? || draw?
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



