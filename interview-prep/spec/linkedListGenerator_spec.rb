
require_relative '../linkedListGenerator'
 
require 'yaml'
require 'spec_helper'

# write code to remove duplicaties from an unsorted linked list

describe LinkedList do

    before :each do
        @LinkedList = LinkedList.new(4000)
        @LinkedList.add(4)
        @LinkedList.add(5)
        @LinkedList.add(3)
        @LinkedList.add(2)
    end

    describe "#delete" do
        it "removes the given value from the linked list" do
            @newList = @LinkedList.delete(5)
        end
    end
 
end