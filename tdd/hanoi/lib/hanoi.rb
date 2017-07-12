require 'byebug'

class NotValidMoveError < StandardError
end

class Hanoi

  attr_reader :board

  def initialize
    @board = [[1, 2, 3], [], []]
  end

  def play
    begin
      until won?
        puts "Input your starting and ending tower"
        from, to = get_input
        move(from, to)
        p board
      end
    rescue NotValidMoveError
      puts "Not a valid move!"
      retry
    end
    puts "You win!"
  end


  # private

  def move(from, to)
    if valid_move?(from, to)
      disc = board[from].shift
      board[to].unshift(disc)
    else
      raise NotValidMoveError
    end
  end

  def won?
    board[1].length == 3 || board[2].length == 3
  end

  def get_input

    input = $stdin.gets.chomp.split(",")
    input.map{|x| x.to_i}
  end

  def valid_move?(from, to)
    return false if board[from].empty?
    return true if board[to].empty?
    disc = board[from][0]
    disc < board[to].first ? true : false
  end

end
