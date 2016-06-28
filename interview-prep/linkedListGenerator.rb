# Quick Example of a Self Referential Data Structure in Ruby 
# NODE -> contains a value and a pointer to (next_node)
# LinkedList -> This class holds the linked list functions - adding a node, traversing and displaying the linked list

class Node

    attr_accessor :value, :next_node

    def initialize val,next_in_line
        @value = val
        @next_nodex = next_in_line
    end
end

class LinkedList

    def initialize val
        # Initialize a new node at the head
        @head = Node.new(val,nil)
        @tail = @head
    end
    
    def add(value)
        # Traverse to the end of the list
        # And insert a new node over there with the specified value
        current = @head
        while current.next_node != nil
            current = current.next_node
        end 
        current.next_node = Node.new(value,nil)
        @tail = current
        self    
    end

    def delete(val)
        current = @head
        if current.value == val
            # If the head is the element to be delete, the head needs to be updated
            @head = @head.next_node
        else
            # ... x -> y -> z
            # Suppose y is the value to be deleted, you need to reshape the above list to :
            #   ... x->z
            # ( and z is basically y.next_node )
            current = @head
            #while current and it's next node has a value and the next node doesn't match
            while (current != nil) && (current.next_node != nil) && ((current.next_node).value != val)
                #keep on iterating
                current = current.next_node
            end 

            if (current != nil) && (current.next_node != nil)
                current.next_node = (current.next_node).next_node
            end
        end
    end

    def removeDups
        current = @head
        list_values = []
        while current.next_node != nil 
            if list_values.include? current.value
                self.delete(current.value)
            else
                list_values.push(current.value)
            end
            current = current.next_node
        end
        self.display
    end
    
    def display
        # Traverse through the list till you hit the "nil" at the end
        current = @head
        full_list = [] 
        while current.next_node != nil 
            full_list += [current.value.to_s]
            current = current.next_node
        end
        full_list += [current.value.to_s]
        puts full_list.join("->")
    end

end

$list = LinkedList.new(4000000)
$list.add(3)
$list.add(3)
$list.add(3)
$list.add(5)
$list.add(7)
$list.add(200000)
$list.add(2)
$list.add(50000)
$list.add(7)
$list.add(4)

$list.removeDups()
