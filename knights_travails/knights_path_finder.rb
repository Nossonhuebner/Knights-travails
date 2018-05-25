require_relative 'moves_tree'
require 'byebug'

class KnightPathFinder
  
  def self.valid_moves(pos)
    row,col = pos
    arr = []
    (-2..2).each do |jump1|
      next if jump1 == 0
      (-2..2).each do |jump2|
        next if jump2 == 0 || jump2.abs == jump1.abs
        arr << [(row+jump1), (col+jump2)] 
      end 
    end
    arr.reject { |plot| plot.any? { |coordinate| !coordinate.between?(0,7) } }      
  end
  
  def initialize(start)
    @start = Moves.new(start) #i.e., [0,0]
    @visited_positions = [start] #[@position]
  end
  
  def find_path(plot)
  end
  
  def build_move_tree
    arr = new_move_positions(@pstart.position)
    
    until arr.empty?
     Moves.new(arr.first)
     
    end
      
  end
  
  def new_move_positions(pos)
    new_moves = KnightPathFinder.valid_moves(pos).reject { |move| @visited_positions.include?(move) }
    @visited_positions << new_moves 
    new_moves
  end
  
  
  
end

