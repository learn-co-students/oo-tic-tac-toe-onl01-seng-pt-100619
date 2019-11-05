require 'pry'


class TicTacToe
  
  attr_accessor :board 
  
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6],
    ]
  
  def initialize(board)
     @board =  [" "," "," "," "," "," ",""," "," "]
   end 
  
  def self.display_board(board)
    
    puts "#{@board[0]} | #{@board[1]} | #{@board[2]}"
    puts "---------------------------------------"
    puts "#{@board[3]} | #{@board[4]} | #{@board[5]}"
    puts "---------------------------------------"
    puts "#{@board[6]} | #{@board[7]} | #{@board[8]}"
  end 
  
  def self.input_to_index(user_input)
    gets.chomp = user_input
    user_input.to_i - 1 
  end 
    
  def self.move(board,index,player="X")
     board[index]=player
  end 
  
  def self.position_taken?(board,index)
     if (board[index] == "") || (board[index]=="") || (board[index]==nil)
       return false
     else 
       return true 
     end 
    end

    
  def self.valid_move?(board,index)
    if index.between?(0,8) && !position_taken?(board,index)
      return true
    end 
  end 
  
  def self.turn_count(board)
    counter = 0 
    board.each do |spaces|
      if spaces == "X" || spaces == "O"
        counter =+1 
      end 
    end 
    counter 
  end 
  
  def self.current_player(board)
    turn_count(board) % 2 == 0 ? "x" : "O" 
  end 
  
  def self.play(board)
    until over?(board)
    turn(board)
  end 
  if won?(board)
    winner(board) == "X" || winner(board) == "O"
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cat's Game!"
  end 
end 

 def self.turn(board)
   puts "Please enter 1-9:"
   user_input = gets.strip
   index = 
   input_to_index(user_input)
      if valid_move?(board,index)
        move(board,index,current_player(board))
        turn(board)
      end 
        display_board(board)
      end 
      
  def self.won?(board)
    WIN_COMBINATIONS.each do |win_combination| 
       win_index_1 = win_combination[0]
       win_index_2 = win_combination[1]
       win_index_3 = win_combination[2]
       
       position_1 = board[win_index_1] # value of board at win_index_1
       position_2 = board[win_index_2] # value of board at win_index_2
       position_3 = board[win_index_3] # value of board at win_index_3
       
       position_1 == position_2 && position_2 == position_3 && position_taken?(board,win_index_1)
     end 
   end 
   
   def self.full?(board)
     board.all? {|i| i == "X" || i == "O"}
   end 
   
   def self.draw?(board)
     if !won?(board) && full?(board) 
       return true
     elsif !won?(board) && !full?(board)
       return false 
     else won?(board) 
       return false 
     end 
   end 
   
   def self.over?(board)
     if draw?(board) || won?(board) || full?(board) 
       return true
     end 
   end 
   
   def self.winner(board)
     if won?(board)
       return board[won?(board)[0]]
     end 
   end
   
   
end 



