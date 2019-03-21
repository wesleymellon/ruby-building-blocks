def bubble_sort(arr)
  arr.length.times do
    arr.each_with_index do |e, i|
      if ((i < arr.length - 1) && (e > arr[i+1]))
        swap(arr, i, i+1)
      end
    end
  end

  arr
end

def bubble_sort_by(arr)
  arr.length.times do
    arr.each_with_index do |e, i|
      break if i >= arr.length - 1
      comparison = yield(e, arr[i+1]) > 0
      
      if ((i < arr.length - 1) && comparison)
        swap(arr, i, i+1)
      end
    end
  end

  arr

end

def swap(arr, i, j)
  arr[i], arr[j] = arr[j], arr[i]
end

