module Enumerable
  def my_each
    for e in self
      yield(e)
    end
  end

  def my_each_with_index
    i = 0
    for e in self
      yield(e, i)
      i += 1
    end
  end

  def my_select
    filtered_elements = []
    for e in self
      if yield(e)
        filtered_elements << e
      end
    end

    filtered_elements
  end

  def my_select2
    filtered_elements = []
    self.my_each do |e|
      if yield(e)
        filtered_elements << e
      end
    end

    filtered_elements
  end

  def my_all?
    is_all = true
    self.my_each do |e|
      if !yield(e)
        is_all = false
      end
    end

    is_all
  end

  def my_any?
    is_any = false
    self.my_each do |e|
      if yield(e)
        is_any = true
      end
    end

    is_any
  end

  def my_none?
    is_none = true
    self.my_each do |e|
      if yield(e)
        is_none = false
      end
    end

    is_none
  end

  def my_count(target=nil)
    if !block_given? && target.nil?
      return self.length
    end

    count = 0
    self.my_each do |e|
      if block_given? && yield(e)
        count += 1
      elsif e == target
        count += 1
      end
    end

    count
  end

  def my_map(my_proc=nil)
    mapped_arr = []
    unless my_proc.nil?
      self.my_each do |e|
        mapped_arr << my_proc.call(e)
      end

      return mapped_arr
    end


    if block_given?
      self.my_each do |e|
        mapped_arr << yield(e)
      end
    end

    mapped_arr
  end

  def my_inject
    total = self[0]
    self.my_each_with_index do |e, i|
      unless i == 0
        total = yield(total, e)
      end
    end

    total
  end
end

# [1,2,3].my_each do |e|
#   puts e % 2 == 0
# end

# [5,6,7].my_each_with_index do |e, i|
#   puts "e is #{e} and i is #{i}"
# end

# arr1 = [1,2,3,4].my_select do |e|
#   e % 2 == 1
# end

# puts arr1

# arr2 = [1,2,3,4].my_select2 do |e|
#   e % 2 == 1
# end

# puts arr2

# var1 = [2,4].my_all? do |e|
#   e % 2 == 0
# end

# puts var1

# var2 = [1,3].my_any? do |e|
#   e % 2 == 0
# end

# puts var2

# var3 = [1,3].my_none? do |e|
#   e % 2 == 0
# end

# puts var3

# var4 = [1,2,3,4,6].my_count do |e|
#   e % 2 == 0
# end

# var5 = [1,2,3,4,1,2,2].my_count(2)

# var6 = [1,2,3,4,5,6].my_count

# puts var4, var5, var6

# var1 = [1,2,3,4].my_map do |e|
#   e += 2
# end

# plus_three = Proc.new do |x|
#   x += 3
# end

# var2 = [1,2,3,4].my_map(&plus_three)

# puts var1, var2

var1 = [4,2,3,4,5].my_inject do |e, x|
  e + x
end

puts var1