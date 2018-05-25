class Moves
  
  def initialize(position)
    @position = position
    @previous_move = nil
    @next_move = []
  end
  
  #self = b, node = a
  def previous_move=(a_parent)
    if previous_move 
      previous_move.next_move.delete(self)
    end 
    
    if a_parent.nil?    
      @previous_move = a_parent
      return
    else
      a_parent.next_move << self unless a_parent.next_move.include?(self)
      @previous_move = a_parent
    end 
  end
  
  def add_child(child)
    next_move << child 
    child.previous_move = self
  end 
  
  def remove_child(node)
    raise "Not a child" unless next_move.include?(node)
    
    next_move.delete(node)
    node.previous_move = nil
  end

  
  def already_child_of?(node)
    node.next_move.include?(self)
  end
  
  def dfs(target)
    return self if self.position == target 
    
    self.next_move.each do |child|
      search = child.dfs(target)
      return search unless search.nil?
    end
    nil
  end 
  
  def bfs(target)
    queue = [self]
    
    until queue.empty?
      return queue.first if queue.first.position == target
      queue.concat(queue.first.next_move) #[nodechild,nodecild]
      queue.shift
    end 
    nil
  end
  
  
  
  
  attr_reader :previous_move, :position, :next_move
  

end