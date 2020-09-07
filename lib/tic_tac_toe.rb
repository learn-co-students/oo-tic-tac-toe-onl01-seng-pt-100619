class TicTacToe
    attr_accessor :board


    WIN_COMBINATIONS = [[0,1,2],
                        [3,4,5],
                        [6,7,8],
                        [0,3,6],
                        [1,4,7],
                        [2,5,8],
                        [0,4,8],
                        [2,4,6]]

    def initialize
        @board = [" "," "," ",
                  " "," "," ",
                  " "," "," "]
    end

    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def input_to_index(input)
        input.to_i - 1
    end

    def move(input_to_index, player)
        @board[input_to_index] = player
    end

    def position_taken?(index)
        @board[index] != " "
    end

    def valid_move?(index)
        @board[index] == " " && index.between?(0,8)
    end

    def turn_count
        count = 0
        @board.each do |field|
            count = count + 1 if field != " "
        end
        count
    end

    def current_player
        if turn_count() == 0 || turn_count.even?
            return "X"
        else
            return "O"
        end
    end

    def turn
        puts "Enter number:"
        input = gets.chomp
        input = input_to_index(input)
        if valid_move?(input)
            x_or_o = current_player
            move(input, x_or_o)
        elsif !valid_move?(input) 
            turn
        end

        display_board
    end

    def won?	
        WIN_COMBINATIONS.detect do |combo|
            @board[combo[0]] == @board[combo[1]] &&
            @board[combo[1]] == @board[combo[2]] &&
            position_taken?(combo[0])
        end
    end	
    
      def full?	
        turn_count == 9	
      end	
    
      def draw?	
        full? && !won?	
      end	
    
      def over?	
        won? || draw?	
      end	
    
      def winner	
        if combo = won?	
          @board[combo[0]]	
        end	
      end	
    
      def play
        turn until over?	
        puts winner ? "Congratulations #{winner}!" : "Cat's Game!"	
      end
end

