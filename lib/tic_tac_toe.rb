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