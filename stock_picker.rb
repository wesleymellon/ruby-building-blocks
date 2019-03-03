def stock_picker(arr)
  return nil if arr.length < 2

  current_lowest_index = 0
  best_low_index = 0
  best_high_index = 1
  max_diff = -100000
  arr.each_with_index do |element, index|
    next if index == 0

    current_diff = element - arr[current_lowest_index]

    if current_diff > max_diff
      best_low_index  = current_lowest_index
      best_high_index = index
      max_diff        = current_diff
    elsif element > arr[best_high_index]
      best_high_index = index
      max_diff = best_high_index - best_low_index
    end

    if element < arr[best_low_index]
      current_lowest_index = index
    end
  end

  [best_low_index, best_high_index]
end

