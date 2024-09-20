#* 1. Remove Duplicates
puts "\n\n1. Remove Duplicates: "

=begin
  Write a method remove_duplicates that takes an array and returns a new array with duplicate
  elements removed.
=end


#* Solution
def remove_duplicates(array)



end

puts remove_duplicates([1, 2, 2, 3, 3, 4]) # => [1, 2, 3, 4]
puts remove_duplicates(["a", "b", "a", "c"]) # => ["a", "b", "c"]
puts remove_duplicates([1]) # => [1]



#* 2. Flatten A Nested Array
puts "\n\n2. Flatten A Nested Array: "

=begin
  Write a method flatten_array that takes a nested array and returns a new array where all
  sub-arrays are flattened into one.
=end


#* Solution:
def flatten_array(array)



end

puts flatten_array([[1, 2], [3, 4], [5]]) # => [1, 2, 3, 4, 5]
puts flatten_array([[1], [2, [3, 4]], 5]) # => [1, 2, 3, 4, 5]
puts flatten_array([1, 2, 3]) # => [1, 2, 3], already flat



#* 3. Rotate Array Elements
puts "\n\n3. Rotate Array Elements: "

=begin
  Write a method rotate_array that takes an array and an integer n, and rotates the array by n positions.
  Positive n means rotating rightm negative n means rotating left.
=end


#* Solution
def rotate_array(array, n)



end

puts rotate_array([1, 2, 3, 4, 5], 2) # => [4, 5, 1, 2, 3]
puts rotate_array([1, 2, 3, 4, 5], -1) # => [2, 3, 4, 5, 1]
puts rotate_array([1, 2, 3], 3) # => [1, 2, 3], full rotation



#* 4. Find Unique Elements
puts "\n\n4. Find Unique Elements: "

=begin
  Write a method find_uniques that takes an array and returns an array with only the elements
  that appear exactly once.
=end


#* Solution
def find_uniques(array)



end

puts find_uniques([1, 2, 2, 3, 3, 4]) # => [1, 4]
puts find_uniques([10, 20, 20, 30]) # => [10, 30]
puts find_uniques([1, 1, 1]) # => []



#* 5. Find Intersection of Two Arrays
puts "\n\n5. Find Intersection of Two Arrays: "

=begin
  Write a method find_intersection that takes two arrays and returns an array with elements common
  to both arrays (intersection).
=end


#* Solution
def find_intersection(array1, array2)



end

puts find_intersection([1, 2, 3], [2, 3, 4]) # => [2, 3]
puts find_intersection([5, 6, 7], [7, 8, 9]) # => [7]
puts find_intersection([1, 2], [3, 4]) # => []



#* 6. Find the Second Largest Element
puts "\n\n6. Find the Second Largest Element: "

=begin
  Write a method second_largest that takes an array of numbers and returns the second largest
  element. Assume that array has atleast two distinct elements.
=end


#* Solution
def second_largest(array)



end

puts second_largest([10, 20, 30, 40]) # => 30
puts second_largest([5, 5, 5, 3]) # => 3
puts second_largest([-1, -2, -3]) # => -2



#* 7. Sum of Even Elements
puts "\n\n7. Sum of Even Elements: "

=begin
  Write a method sum_of_evens that takes an array of integers and return the sum of all even
  numbers in the array.
=end


#* Solution
def sum_of_evens(array)



end

puts sum_of_evens([1, 2, 3, 4, 5, 6]) # => 12
puts sum_of_evens([10, 15, 20]) # => 30
puts sum_of_evens([1, 3, 5]) # => 0



#* 8. Merge Two Sorted Arrays
puts "\n\n8. Merge Two Sorted Arrays: "

=begin
  Write a method merge_sorted_arrays that takes two sorted arrays and returns a new array that contains
  all elements from both arrays, sorted.
=end


#* Solution
def merge_sorted_arrays(array1, array2)



end

puts merge_sorted_arrays([1, 3, 5], [2, 4, 6]).inspect # => [1, 2, 3, 4, 5, 6]
puts merge_sorted_arrays([10, 20], [5, 15]).inspect # => [5, 10, 15, 20]
puts merge_sorted_arrays([], [1, 2, 3]).inspect # => [1, 2, 3]



#* 9. Check if Array is Sorted
puts "\n\n9. Check if Array is Sorted: "

=begin
  Write a method is_sorted that takes an array of numbers and returns true if the array is sorted in
  non-decreasing order, and false otherwise.
=end


#* Solution
def is_sorted(array)



end

puts is_sorted([1, 2, 3, 4, 5]) # => true
puts is_sorted([5, 4, 3, 2, 1]) # => false
puts is_sorted([1, 2, 3, 3, 4]) # => true



#* 10. Find Missing Number in Sequence
puts "\n\n10. Find Missing Number in Sequence: "

=begin
  Write a method find_missing_number that takes an array of integers containing numbers from 1 to n with
  one number missing and returns the missing number.
=end


#* Solution
def find_missing_number(array)



end

puts find_missing_number([1, 2, 4, 5]) # => 3
puts find_missing_number([2, 3, 4, 5]) # => 1
puts find_missing_number([1, 2, 3]) # => 4
