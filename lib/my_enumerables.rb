module Enumerable
  # Your code goes here
  def my_each_with_index
    index = 0
    my_each do |element|
      yield(element, index)
      index += 1
    end
  end

  def my_select
    result = []
    my_each do |element|
      result << element if yield(element)
    end
    result
  end

  def my_all?
    my_each do |element|
      return false unless yield(element)
    end
    true
  end

  def my_any?
    my_each do |element|
      return true if yield(element)
    end
    false
  end

  def my_none?
    my_each do |element|
      return false if yield(element)
    end
    true
  end

  def my_count
    count = 0
    my_each { |element| count += 1 if !block_given? || yield(element) }
    count
  end

  def my_map
    mapped = []
    my_each { |element| mapped << yield(element) }
    mapped
  end

  def my_inject(init = false)
    acc = init
    my_each do |element|
      if acc
        acc = yield(acc, element)
      else
        acc = self[0]
      end
    end
    acc
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  def my_each
    for element in self do
      yield(element)
    end
  end
end

array = [1, 1, 2, 3, 5, 8, 13, 21, 34]

p array.my_inject(10) { |sum, value| sum + value }