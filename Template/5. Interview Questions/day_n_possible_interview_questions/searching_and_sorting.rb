#* 1. Linear Search
puts "\n\n1. Linear Search: "

=begin
  Linear search is a simple algorithm that checks each element in the list sequentially
  until the target element is found or the list ends.
=end

# Solution:
def linear_search(arr, target)
  arr.each_with_index do |element, index|
    return index if element == target
  end
  nil
end

# Edge Cases:
puts linear_search([], 5).inspect # Output: nil (Empty array)
puts linear_search([5, 3, 8, 4, 2], 5).inspect # Output: 0 (First element)
puts linear_search([5, 3, 8, 4, 2], 2).inspect # Output: 4 (Last element)
puts linear_search([5, 3, 8, 4, 2], 7).inspect # Output: nil (Not in array)
puts linear_search([5, 3, 8, 4, 2, 5], 5).inspect # Output: 0 (Duplicate elements)



#* 2. Binary Search
puts "\n\n2. Binary Search: "

=begin
  Binary search is an efficient algorithm for finding an item
  from a sorted list of items by repeatedly dividing the search interval in half.
=end

# Solution:
def binary_search(arr, target)
  low = 0
  high = arr.length - 1

  while low <= high
    mid = (low + high) / 2
    if arr[mid] == target
      return mid
    elsif arr[mid] < target
      low = mid + 1
    else
      high = mid - 1
    end
  end
  nil
end

# Edge Cases:
puts binary_search([], 5).inspect # Output: nil (Empty array)
puts binary_search([2, 3, 4, 5, 8], 2).inspect # Output: 0 (First element)
puts binary_search([2, 3, 4, 5, 8], 8).inspect # Output: 4 (Last element)
puts binary_search([2, 3, 4, 5, 8], 7).inspect # Output: nil (Not in array)
puts binary_search([2, 3, 4, 5, 5, 8], 5).inspect # Output: 3 or 4 (Duplicate elements)



#* 3. Jump Search
puts "\n\n3. Jump Search: "

=begin
  Jump search works by jumping ahead by fixed steps and then performing a
  linear search within the block.
=end

# Solution:
def jump_search(arr, target)
  length = arr.length
  step = Math.sqrt(length).to_i
  prev = 0

  while arr[[step, length].min - 1] < target
    prev = step
    step += Math.sqrt(length).to_i
    return nil if prev >= length
  end

  while arr[prev] < target
    prev += 1
    return nil if prev == [step, length].min
  end

  return prev if arr[prev] == target
  nil
end

# Edge Cases:
puts jump_search([], 5).inspect # Output: nil (Empty array)
puts jump_search([2, 3, 4, 5, 8], 2).inspect # Output: 0 (First element)
puts jump_search([2, 3, 4, 5, 8], 8).inspect # Output: 4 (Last element)
puts jump_search([2, 3, 4, 5, 8], 7).inspect # Output: nil (Not in array)
puts jump_search([2, 3, 4, 5, 5, 8], 5).inspect # Output: 3 or 4 (Duplicate elements)



#* 4. Interpolation Search
puts "\n\n4. Interpolation Search: "

=begin
  Interpolation search is an improved variant of binary search for
  uniformly distributed data, estimating the position of the target value.
=end

# Solution:
def interpolation_search(arr, target)
  low = 0
  high = arr.length - 1

  while low <= high && target >= arr[low] && target <= arr[high]
    pos = low + ((target - arr[low]) * (high - low) / (arr[high] - arr[low])).to_i

    return pos if arr[pos] == target

    if arr[pos] < target
      low = pos + 1
    else
      high = pos - 1
    end
  end
  nil
end

# Edge Cases:
puts interpolation_search([], 5).inspect # Output: nil (Empty array)
puts interpolation_search([2, 3, 4, 5, 8], 2).inspect # Output: 0 (First element)
puts interpolation_search([2, 3, 4, 5, 8], 8).inspect # Output: 4 (Last element)
puts interpolation_search([2, 3, 4, 5, 8], 7).inspect # Output: nil (Not in array)
puts interpolation_search([2, 3, 4, 5, 5, 8], 5).inspect # Output: 3 or 4 (Duplicate elements)



#* 5. Exponential Search
puts "\n\n5. Exponential Search: "

=begin
 Exponential search is a combination of binary search and exponential growth,
 useful for unbounded or infinite lists.
=end

# Solution:
def exponential_search(arr, target)
  return 0 if arr[0] == target

  i = 1
  while i < arr.length && arr[i] <= target
    i *= 2
  end

  binary_search(arr[(i/2)..[i, arr.length].min], target)
end

# Edge Cases:
puts exponential_search([], 5).inspect # Output: nil (Empty array)
puts exponential_search([2, 3, 4, 5, 8], 2).inspect # Output: 0 (First element)
puts exponential_search([2, 3, 4, 5, 8], 8).inspect # Output: 4 (Last element)
puts exponential_search([2, 3, 4, 5, 8], 7).inspect # Output: nil (Not in array)
puts exponential_search([2, 3, 4, 5, 5, 8], 5).inspect # Output: 3 or 4 (Duplicate elements)



#* 6. Fibonacci Search
puts "\n\n6. Fibonacci Search: "

=begin
  Fibonacci search is similar to binary search but uses Fibonacci
  numbers to divide the array into smaller sections.
=end

# Solution:
def fibonacci_search(arr, target)
  fib_m2 = 0
  fib_m1 = 1
  fib_m = fib_m2 + fib_m1

  while fib_m < arr.length
    fib_m2 = fib_m1
    fib_m1 = fib_m
    fib_m = fib_m2 + fib_m1
  end

  offset = -1

  while fib_m > 1
    i = [offset + fib_m2, arr.length - 1].min

    if arr[i] < target
      fib_m = fib_m1
      fib_m1 = fib_m2
      fib_m2 = fib_m - fib_m1
      offset = i
    elsif arr[i] > target
      fib_m = fib_m2
      fib_m1 -= fib_m2
      fib_m2 = fib_m - fib_m1
    else
      return i
    end
  end

  return offset + 1 if fib_m1 && arr[offset + 1] == target
  nil
end

# Edge Cases:
puts fibonacci_search([], 5).inspect # Output: nil (Empty array)
puts fibonacci_search([2, 3, 4, 5, 8], 2).inspect # Output: 0 (First element)
puts fibonacci_search([2, 3, 4, 5, 8], 8).inspect # Output: 4 (Last element)
puts fibonacci_search([2, 3, 4, 5, 8], 7).inspect # Output: nil (Not in array)
puts fibonacci_search([2, 3, 4, 5, 5, 8], 5).inspect # Output: 3 or 4 (Duplicate elements)



#* 7. Ternary Search
puts "\n\n7. Ternary Search: "

=begin
  Ternary search is a divide-and-conquer search algorithm
  that splits the array into three parts instead of two.
=end

# Solution:
def ternary_search(arr, target, left = 0, right = arr.length - 1)
  return nil if left > right

  mid1 = left + (right - left) / 3
  mid2 = right - (right - left) / 3

  return mid1 if arr[mid1] == target
  return mid2 if arr[mid2] == target

  if target < arr[mid1]
    ternary_search(arr, target, left, mid1 - 1)
  elsif target > arr[mid2]
    ternary_search(arr, target, mid2 + 1, right)
  else
    ternary_search(arr, target, mid1 + 1, mid2 - 1)
  end
end

# Edge Cases:
puts ternary_search([], 5).inspect # Output: nil (Empty array)
puts ternary_search([2, 3, 4, 5, 8], 2).inspect # Output: 0 (First element)
puts ternary_search([2, 3, 4, 5, 8], 8).inspect # Output: 4 (Last element)
puts ternary_search([2, 3, 4, 5, 8], 7).inspect # Output: nil (Not in array)
puts ternary_search([2, 3, 4, 5, 5, 8], 5).inspect # Output: 3 or 4 (Duplicate elements)



#* 8. Depth-First Search (DFS)

=begin
  DFS is an algorithm for traversing or searching tree or graph data structures,
  starting at the root and exploring as far as possible along each branch before
  backtracking.
=end

# Solution:
class Node
  attr_accessor :value, :left, :right

  def initialize(value)
    @value = value
    @left = nil
    @right = nil
  end
end

def dfs(root, target)
  return nil if root.nil?
  return root if root.value == target

  left_search = dfs(root.left, target)
  return left_search if left_search

  dfs(root.right, target)
end

# Edge Cases:
root = Node.new(1)
root.left = Node.new(2)
root.right = Node.new(3)
root.left.left = Node.new(4)
root.left.right = Node.new(5)

puts dfs(nil, 5).inspect # Output: nil (Empty tree)
puts dfs(root, 1).value # Output: 1 (Target is root)
puts dfs(root, 4).value # Output: 4 (Target is leaf)
puts dfs(root, 6).inspect # Output: nil (Target not in tree)
root.left.right.left = Node.new(5)
puts dfs(root, 5).value # Output: 5 (Duplicate elements)



#* 9. Breadth-First Search (BFS)
puts "\n\n9. Breadth-First Search (BFS): "

=begin
  BFS is an algorithm for traversing or searching tree or graph data structures, starting at the
  root and exploring all neighbors at the present depth before moving on to nodes at the next depth level.
=end

# Solution:
class Node
  attr_accessor :value, :left, :right

  def initialize(value)
    @value = value
    @left = nil
    @right = nil
  end
end

def bfs(root, target)
  return nil if root.nil?

  queue = [root]
  until queue.empty?
    node = queue.shift
    return node if node.value == target

    queue.push(node.left) if node.left
    queue.push(node.right) if node.right
  end
  nil
end

# Edge Cases:
root = Node.new(1)
root.left = Node.new(2)
root.right = Node.new(3)
root.left.left = Node.new(4)
root.left.right = Node.new(5)

puts bfs(nil, 5).inspect # Output: nil (Empty tree)
puts bfs(root, 1).value # Output: 1 (Target is root)
puts bfs(root, 4).value # Output: 4 (Target is leaf)
puts bfs(root, 6).inspect # Output: nil (Target not in tree)
root.left.right.left = Node.new(5)
puts bfs(root, 5).value # Output: 5 (Duplicate elements)



#* 10. Hash Search
puts "\n\n10. Hash Search: "

=begin
 Hash search uses a hash table to map keys to values, allowing for fast data retrieval.
=end

# Solution:
def hash_search(hash, key)
  hash[key]
end

# Edge Cases:
puts hash_search({}, :a).inspect # Output: nil (Empty hash)
puts hash_search({ a: 1, b: 2, c: 3 }, :a).inspect # Output: 1 (First element)
puts hash_search({ a: 1, b: 2, c: 3 }, :c).inspect # Output: 3 (Last element)
puts hash_search({ a: 1, b: 2, c: 3 }, :d).inspect # Output: nil (Key not in hash)
puts hash_search({ a: 1, b: 2, c: 1 }, :a).inspect # Output: 1 (Duplicate values)



#* 11. Bubble Sort
puts "\n\n11. Bubble Sort: "

=begin
  Bubble Sort is a simple comparison-based sorting algorithm that repeatedly steps through the list,
  compares adjacent elements, and swaps them if they are in the wrong order.
=end

# Solution:
def bubble_sort(arr)
  n = arr.length
  loop do
    swapped = false
    (n-1).times do |i|
      if arr[i] > arr[i+1]
        arr[i], arr[i+1] = arr[i+1], arr[i]
        swapped = true
      end
    end
    break unless swapped
  end
  arr
end

# Edge Cases:
puts bubble_sort([]).inspect # Output: [] (Empty array)
puts bubble_sort([1]).inspect # Output: [1] (One element)
puts bubble_sort([2, 2, 2]).inspect # Output: [2, 2, 2] (All elements the same)
puts bubble_sort([1, 2, 3]).inspect # Output: [1, 2, 3] (Already sorted)
puts bubble_sort([3, 2, 1]).inspect # Output: [1, 2, 3] (Reverse order)



#* 2. Selection Sort
puts "\n\n2. Selection Sort: "

=begin
  Selection Sort is a comparison-based sorting algorithm that selects the smallest
  element from an unsorted list in each iteration and places it at the beginning.
=end

# Solution:
def selection_sort(arr)
  n = arr.length
  (0...n).each do |i|
    min_index = i
    (i+1...n).each do |j|
      min_index = j if arr[j] < arr[min_index]
    end
    arr[i], arr[min_index] = arr[min_index], arr[i] if min_index != i
  end
  arr
end

# Edge Cases:
puts selection_sort([]).inspect # Output: [] (Empty array)
puts selection_sort([1]).inspect # Output: [1] (One element)
puts selection_sort([2, 2, 2]).inspect # Output: [2, 2, 2] (All elements the same)
puts selection_sort([1, 2, 3]).inspect # Output: [1, 2, 3] (Already sorted)
puts selection_sort([3, 2, 1]).inspect # Output: [1, 2, 3] (Reverse order)



#* 3. Insertion Sort
puts "\n\n"

=begin
  Insertion Sort is a comparison-based sorting algorithm that builds the final sorted list one item at a
  time by repeatedly taking the next item and inserting it into the correct position.
=end

# Solution:
def insertion_sort(arr)
  (1...arr.length).each do |i|
    key = arr[i]
    j = i - 1
    while j >= 0 && arr[j] > key
      arr[j + 1] = arr[j]
      j -= 1
    end
    arr[j + 1] = key
  end
  arr
end

# Edge Cases:
puts insertion_sort([]).inspect # Output: [] (Empty array)
puts insertion_sort([1]).inspect # Output: [1] (One element)
puts insertion_sort([2, 2, 2]).inspect # Output: [2, 2, 2] (All elements the same)
puts insertion_sort([1, 2, 3]).inspect # Output: [1, 2, 3] (Already sorted)
puts insertion_sort([3, 2, 1]).inspect # Output: [1, 2, 3] (Reverse order)



#* 4. Merge Sort
puts "\n\n4. Merge Sort: "

=begin
  Merge Sort is a divide-and-conquer algorithm that divides the input array
  into two halves, sorts each half, and then merges the two sorted halves.
=end

# Solution:
def merge_sort(arr)
  return arr if arr.length <= 1

  mid = arr.length / 2
  left = merge_sort(arr[0...mid])
  right = merge_sort(arr[mid..-1])
  merge(left, right)
end

def merge(left, right)
  sorted = []
  until left.empty? || right.empty?
    if left.first <= right.first
      sorted << left.shift
    else
      sorted << right.shift
    end
  end
  sorted + left + right
end

# Edge Cases:
puts merge_sort([]).inspect # Output: [] (Empty array)
puts merge_sort([1]).inspect # Output: [1] (One element)
puts merge_sort([2, 2, 2]).inspect # Output: [2, 2, 2] (All elements the same)
puts merge_sort([1, 2, 3]).inspect # Output: [1, 2, 3] (Already sorted)
puts merge_sort([3, 2, 1]).inspect # Output: [1, 2, 3] (Reverse order)



#* 5. Quick Sort
puts "\n\n5. Quick Sort: "

=begin
  Quick Sort is a divide-and-conquer algorithm that selects a “pivot” element from the array and partitions
  the other elements into two sub-arrays, according to whether they are less than or greater than the pivot.
=end

# Solution:
def quick_sort(arr)
  return arr if arr.length <= 1

  pivot = arr.delete_at(rand(arr.length))
  left, right = arr.partition { |x| x < pivot }
  [*quick_sort(left), pivot, *quick_sort(right)]
end

# Edge Cases:
puts quick_sort([]).inspect # Output: [] (Empty array)
puts quick_sort([1]).inspect # Output: [1] (One element)
puts quick_sort([2, 2, 2]).inspect # Output: [2, 2, 2] (All elements the same)
puts quick_sort([1, 2, 3]).inspect # Output: [1, 2, 3] (Already sorted)
puts quick_sort([3, 2, 1]).inspect # Output: [1, 2, 3] (Reverse order)



#* 6. Heap Sort
puts "\n\n6. Heap Sort: "

=begin
  Heap Sort is a comparison-based sorting algorithm that uses a binary heap data structure. It first builds
  a heap from the input data, and then repeatedly extracts the maximum element from the heap, which
  results in a sorted array.
=end

# Solution:
def heap_sort(arr)
  n = arr.length

  (n / 2 - 1).downto(0) { |i| heapify(arr, n, i) }
  (n - 1).downto(1) do |i|
    arr[0], arr[i] = arr[i], arr[0]
    heapify(arr, i, 0)
  end
  arr
end

def heapify(arr, n, i)
  largest = i
  left = 2 * i + 1
  right = 2 * i + 2

  largest = left if left < n && arr[left] > arr[largest]
  largest = right if right < n && arr[right] > arr[largest]

  if largest != i
    arr[i], arr[largest] = arr[largest], arr[i]
    heapify(arr, n, largest)
  end
end

# Edge Cases:
puts heap_sort([]).inspect # Output: [] (Empty array)
puts heap_sort([1]).inspect # Output: [1] (One element)
puts heap_sort([2, 2, 2]).inspect # Output: [2, 2, 2] (All elements the same)
puts heap_sort([1, 2, 3]).inspect # Output: [1, 2, 3] (Already sorted)
puts heap_sort([3, 2, 1]).inspect # Output: [1, 2, 3] (Reverse order)



#* 7. Counting Sort
puts "\n\n7. Counting Sort: "

=begin
  Counting Sort is a non-comparison-based sorting algorithm that sorts elements by
  counting the number of occurrences of each unique element in the array.
=end

# Solution:
def counting_sort(arr, max_value)
  counts = Array.new(max_value + 1, 0)
  arr.each { |num| counts[num] += 1 }

  sorted_index = 0
  counts.each_with_index do |count, num|
    count.times do
      arr[sorted_index] = num
      sorted_index += 1
    end
  end
  arr
end

# Edge Cases:
puts counting_sort([], 5).inspect # Output: [] (Empty array)
puts counting_sort([1], 1).inspect # Output: [1] (One element)
puts counting_sort([2, 2, 2], 2).inspect # Output: [2, 2, 2] (All elements the same)
puts counting_sort([0, 1, 2, 3, 4, 5], 5).inspect # Output: [0, 1, 2, 3, 4, 5] (Elements from 0 to max_value)
puts counting_sort([6, 7, 8], 5).inspect # Output: [6, 7, 8] (Elements not in range 0 to max_value)



#* 8. Radix Sort
puts "\n\n8. Radix Sort: "

=begin
  Radix Sort is a non-comparison-based sorting algorithm that sorts numbers by processing individual digits.
  It processes digits from the least significant to the most significant.
=end

# Solution:
def radix_sort(arr)
  max_num = arr.max
  exp = 1
  while max_num / exp > 0
    counting_sort_by_digit(arr, exp)
    exp *= 10
  end
  arr
end

def counting_sort_by_digit(arr, exp)
  output = Array.new(arr.length, 0)
  count = Array.new(10, 0)

  arr.each { |num| count[(num / exp) % 10] += 1 }
  (1...10).each { |i| count[i] += count[i - 1] }

  (arr.length - 1).downto(0) do |i|
    output[count[(arr[i] / exp) % 10] - 1] = arr[i]
    count[(arr[i] / exp) % 10] -= 1
  end

  (0...arr.length).each { |i| arr[i] = output[i] }
end

# Edge Cases:
puts radix_sort([]).inspect # Output: [] (Empty array)
puts radix_sort([1]).inspect # Output: [1] (One element)
puts radix_sort([2, 2, 2]).inspect # Output: [2, 2, 2] (All elements the same)
puts radix_sort([170, 45, 75, 90, 802, 24, 2, 66]).inspect # Output: [2, 24, 45, 66, 75, 90, 170, 802] (Different number of digits)
puts radix_sort([-170, -45, -75, -90, -802, -24, -2, -66]).inspect # Output: [-802, -170, -90, -75, -66, -45, -24, -2] (Negative numbers)



#* 9. Bucket Sort
puts "\n\n9. Bucket Sort: "

=begin
  Bucket Sort is a non-comparison-based sorting algorithm that distributes elements into several buckets,
  sorts each bucket individually, and then concatenates the sorted buckets.
=end

# Solution:
def bucket_sort(arr, bucket_size = 5)
  return arr if arr.empty?

  min_value = arr.min
  max_value = arr.max
  bucket_count = ((max_value - min_value) / bucket_size).floor + 1
  buckets = Array.new(bucket_count) { [] }

  arr.each do |num|
    buckets[((num - min_value) / bucket_size).floor] << num
  end

  arr.clear
  buckets.each do |bucket|
    insertion_sort(bucket)
    arr.concat(bucket)
  end
  arr
end

# Edge Cases:
puts bucket_sort([]).inspect # Output: [] (Empty array)
puts bucket_sort([1]).inspect # Output: [1] (One element)
puts bucket_sort([2, 2, 2]).inspect # Output: [2, 2, 2] (All elements the same)
puts bucket_sort([1, 2, 3, 4, 5]).inspect # Output: [1, 2, 3, 4, 5] (Uniformly distributed)
puts bucket_sort([1, 10, 100, 1000]).inspect # Output: [1, 10, 100, 1000] (Not uniformly distributed)



#* 10. Shell Sort
puts "\n\n10. Shell Sort: "

=begin
  Shell Sort is a comparison-based sorting algorithm that generalizes insertion sort by allowing
  the exchange of items that are far apart. It uses a sequence of gaps to sort elements.
=end

# Solution:
def shell_sort(arr)
  n = arr.length
  gap = n / 2

  while gap > 0
    (gap...n).each do |i|
      temp = arr[i]
      j = i
      while j >= gap && arr[j - gap] > temp
        arr[j] = arr[j - gap]
        j -= gap
      end
      arr[j] = temp
    end
    gap /= 2
  end
  arr
end

# Edge Cases:
puts shell_sort([]).inspect # Output: [] (Empty array)
puts shell_sort([1]).inspect # Output: [1] (One element)
puts shell_sort([2, 2, 2]).inspect # Output: [2, 2, 2] (All elements the same)
puts shell_sort([1, 2, 3]).inspect # Output: [1, 2, 3] (Already sorted)
puts shell_sort([3, 2, 1]).inspect # Output: [1, 2, 3] (Reverse order)
