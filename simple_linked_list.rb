class Node
  attr_accessor :value, :next

  def initialize(data, next_node = nil)
    @value = data
    @next = next_node
  end
end

class SimpleLinkedList
  # is_empty? return true if the linked list  is empty
  def empty?
    @head.nil?
  end

  # push: given a data, add a new node in the end
  def push(data)
    if empty?
      @head = Node.new(data)
    else
      current_node = @head
      new_node = Node.new(data)
      current_node = current_node.next until current_node.next.nil?
      current_node.next = new_node
    end
  end

  # unshift: add a new node in the front
  def unshift(data)
    if empty?
      @head = Node.new(data)
    else
      curr_head = Node.new(data)
      curr_head.next = @head
      @head = curr_head
    end
  end

  #pop: remove the node in the end of the list and return it
  def pop
    if empty?
      return "this list is currently Empty"
    else
      current_node = @head
      while current_node.next.next != nil
        current_node = current_node.next
      end
      last_node = current_node.next
      current_node.next = nil
    end
    last_node
  end

  #remove the first node and return it
  def shift
    if empty?
      return "this list is currently Empty"
    else
      current_head = @head
      new_head = @head.next
      @head.next = nil
      @head = new_head
    end
    current_head
  end
#size: return the quantity of elements of the linked list (size)
  def elements
    if empty?
      count = 0
    else
      count = 1
      current_node = @head
      while current_node.next != nil
        current_node = current_node.next
        count += 1
      end
    end
    count
  end


end

linked_list = SimpleLinkedList.new
linked_list.push(2)
linked_list.push(1)
linked_list.unshift(20)
linked_list.push(5)
puts linked_list.elements

puts linked_list.inspect
