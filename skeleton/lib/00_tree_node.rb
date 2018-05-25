require 'byebug'
class PolyTreeNode
  
  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end
  
  #self = b, node = a
  def parent=(a_parent)
    if parent 
      parent.children.delete(self)
    end 
    
    if a_parent.nil?    
      @parent = a_parent
      return
    else
      a_parent.children << self unless a_parent.children.include?(self)
      @parent = a_parent
    end 
  end
  
  def add_child(child)
    children << child 
    child.parent = self
  end 
  
  def remove_child(node)
    raise "Not a child" unless children.include?(node)
    
    children.delete(node)
    node.parent = nil
  end

  
  def already_child_of?(node)
    node.children.include?(self)
  end
  
  def dfs(target)
    return self if self.value == target 
    
    self.children.each do |child|
      search = child.dfs(target)
      return search unless search.nil?
    end
    nil
  end 
  
  def bfs(target)
    queue = [self]
    
    until queue.empty?
      return queue.first if queue.first.value == target
      queue.concat(queue.first.children) #[nodechild,nodecild]
      queue.shift
    end 
    nil
  end
  
  
  
  
  attr_reader :parent, :value, :children
  

end