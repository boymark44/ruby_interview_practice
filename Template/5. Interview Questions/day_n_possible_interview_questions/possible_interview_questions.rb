#* 1. Two Sum
puts "\n\n1. Two Sum: "

=begin
  Description: Given an array of integers, return indices of the two numbers such that they add up to a specific target.
=end

# Initialize a hash to store the indices of the numbers
# Iterate through the array
# For each number, calculate the complement (target - number)
# If the complement exists in the hash, return the indices
# Otherwise, store the index of the current number in the hash

# Solution:
def two_sum(nums, target)
  hash = {}
  nums.each_with_index do |num, index|
    complement = target - num
    return [hash[complement], index] if hash.key?(complement)
    hash[num] = index
  end
  []
end

# Edge Cases/Tests:
puts two_sum([2, 7, 11, 15], 9).inspect # [0, 1]
puts two_sum([3, 2, 4], 6).inspect # [1, 2]
puts two_sum([3, 3], 6).inspect # [0, 1]
puts two_sum([1, 2, 3, 4, 5], 10).inspect # []
puts two_sum([], 0).inspect # []
puts two_sum([1, 2, 3], 7).inspect # []



#* 2. Merge Two Sorted Lists
puts "\n\n2. Merge Two Sorted Lists: "

=begin
  Merge two sorted linked lists and return it as a new sorted list.
  The new list should be made by splicing together the nodes of the first two lists.
=end

# Initialize a dummy node to act as the head of the merged list
# Use two pointers to traverse the two lists
# Compare the current nodes of both lists and append the smaller node to the merged list
# Move the pointer of the list from which the node was taken
# Append the remaining nodes of the non-empty list to the merged list

# Solution:
class ListNode
  attr_accessor :val, :next
  def initialize(val = 0, _next = nil)
    @val = val
    @next = _next
  end
end

def merge_two_lists(l1, l2)
  dummy = ListNode.new
  current = dummy

  while l1 && l2
    if l1.val < l2.val
      current.next = l1
      l1 = l1.next
    else
      current.next = l2
      l2 = l2.next
    end
    current = current.next
  end

  current.next = l1 || l2
  dummy.next
end

# Edge Cases/Tests:
def print_list(node)
  result = []
  while node
    result << node.val
    node = node.next
  end
  result
end

l1 = ListNode.new(1, ListNode.new(2, ListNode.new(4)))
l2 = ListNode.new(1, ListNode.new(3, ListNode.new(4)))
puts print_list(merge_two_lists(l1, l2)).inspect # [1, 1, 2, 3, 4, 4]

l1 = ListNode.new(1)
l2 = ListNode.new(2)
puts print_list(merge_two_lists(l1, l2)).inspect # [1, 2]

l1 = nil
l2 = ListNode.new(0)
puts print_list(merge_two_lists(l1, l2)).inspect # [0]

l1 = ListNode.new(5)
l2 = ListNode.new(1, ListNode.new(2, ListNode.new(4)))
puts print_list(merge_two_lists(l1, l2)).inspect # [1, 2, 4, 5]

l1 = ListNode.new(1, ListNode.new(3, ListNode.new(5)))
l2 = ListNode.new(2, ListNode.new(4, ListNode.new(6)))
puts print_list(merge_two_lists(l1, l2)).inspect # [1, 2, 3, 4, 5, 6]

l1 = nil
l2 = nil
puts print_list(merge_two_lists(l1, l2)).inspect # []



#* 3. Maximum Subarray
puts "\n\n3. Maximum Subarray"

=begin
Description: Find the contiguous subarray (containing at least one number) which has the largest sum and return its sum.
=end

# Initialize two variables to store the maximum sum and the current sum
# Iterate through the array
# For each number, update the current sum to be the maximum of the current number and the current sum plus the current number
# Update the maximum sum to be the maximum of the maximum sum and the current sum

# Solution:
def max_sub_array(nums)
  max_sum = nums[0]
  current_sum = nums[0]

  nums[1..-1].each do |num|
    current_sum = [num, current_sum + num].max
    max_sum = [max_sum, current_sum].max
  end

  max_sum
end

# Edge Cases/Tests:
puts max_sub_array([-2,1,-3,4,-1,2,1,-5,4]) # 6
puts max_sub_array([1]) # 1
puts max_sub_array([5,4,-1,7,8]) # 23
puts max_sub_array([-1,-2,-3,-4]) # -1
puts max_sub_array([0,0,0,0]) # 0
puts max_sub_array([-2, -1]) # -1



#* 4. Climbing Stairs
puts "\n\n4. Climbing Stairs: "

=begin
  Description: You are climbing a staircase. It takes n steps to reach the top.
  Each time you can either climb 1 or 2 steps.
  In how many distinct ways can you climb to the top?
=end

# Initialize two variables to store the number of ways to reach the first and second steps
# Iterate from the third step to the nth step
# For each step, update the number of ways to reach that step as the sum of the ways to reach the previous two steps

# Solution:
def climb_stairs(n)
  return 1 if n == 1
  first, second = 1, 2
  (3..n).each do
    first, second = second, first + second
  end
  second
end

# Edge Cases/Tests:
puts climb_stairs(2) # 2
puts climb_stairs(3) # 3
puts climb_stairs(4) # 5
puts climb_stairs(5) # 8
puts climb_stairs(1) # 1
puts climb_stairs(10) # 89



#* 5. Valid Parenthesis
puts "\n\n5. Valid Parenthesis: "

=begin
  Description: Given a string containing just the characters ‘(’, ‘)’, ‘{’, ‘}’, ‘[’ and ‘]’,
  determine if the input string is valid. An input string is valid if:

  Open brackets must be closed by the same type of brackets.
  Open brackets must be closed in the correct order.
=end

# Initialize a stack to keep track of opening brackets
# Iterate through the string
# For each character, if it is an opening bracket, push it onto the stack
# If it is a closing bracket, check if the stack is not empty and the top of the stack is the matching opening bracket
# If it is, pop the top of the stack
# If not, return false
# At the end, check if the stack is empty

# Solution:
def is_valid(s)
  stack = []
  pairs = { ')' => '(', '}' => '{', ']' => '[' }
  s.each_char do |char|
    if pairs.values.include?(char)
      stack.push(char)
    elsif pairs.keys.include?(char)
      return false if stack.empty? || stack.pop != pairs[char]
    end
  end
  stack.empty?
end

# Edge Cases/Tests:
puts is_valid("()") # true
puts is_valid("()[]{}") # true
puts is_valid("(]") # false
puts is_valid("([)]") # false
puts is_valid("{[]}") # true
puts is_valid("") # true



#* 6. Merge Intervals
puts "\n\n6. Merge Intervals: "

=begin
  Description: Given a collection of intervals, merge all overlapping intervals.
=end

# Sort the intervals by their start times
# Initialize an array to store the merged intervals
# Iterate through the intervals
# For each interval, if the merged intervals array is empty or the current interval does not overlap with the last merged interval, append it to the merged intervals array
# If it does overlap, merge the current interval with the last merged interval

# Solution:
def merge(intervals)
  return intervals if intervals.empty?
  intervals.sort_by! { |interval| interval[0] }
  merged = [intervals[0]]
  intervals[1..-1].each do |interval|
    if merged.last[1] >= interval[0]
      merged.last[1] = [merged.last[1], interval[1]].max
    else
      merged << interval
    end
  end
  merged
end

# Edge Cases/Tests:
puts merge([[1,3],[2,6],[8,10],[15,18]]).inspect # [[1, 6], [8, 10], [15, 18]]
puts merge([[1,4],[4,5]]).inspect # [[1, 5]]
puts merge([[1,4],[0,4]]).inspect # [[0, 4]]
puts merge([[1,4],[2,3]]).inspect # [[1, 4]]
puts merge([[1,4],[0,0]]).inspect # [[0, 0], [1, 4]]
puts merge([]).inspect # []



#* 7. Find Minimum in Rotated Sorted Array
puts "\n\n7. Find Minimun in Rotated Sorted Array: "

=begin
  Description: Suppose an array of length ( n ) sorted in ascending order is rotated between 1 and ( n ) times.
  Given the rotated array, find the minimum element.
=end

# Initialize two pointers, left and right, to the start and end of the array
# While left is less than right
# Calculate the middle index
# If the middle element is greater than the right element, the minimum is in the right half
# Otherwise, the minimum is in the left half
# Return the element at the left pointer

# Solution:
def find_min(nums)
  left, right = 0, nums.length - 1
  while left < right
    mid = (left + right) / 2
    if nums[mid] > nums[right]
      left = mid + 1
    else
      right = mid
    end
  end
  nums[left]
end

# Edge Cases/Tests:
puts find_min([3,4,5,1,2]) # 1
puts find_min([4,5,6,7,0,1,2]) # 0
puts find_min([11,13,15,17]) # 11
puts find_min([2,1]) # 1
puts find_min([1]) # 1
puts find_min([1,2,3,4,5,6,7,8,9,10]) # 1



#* 8. Longest Common Prefix
puts "\n\n8. Longest Common Prefix: "

=begin
Description: Write a function to find the longest common prefix string amongst an array of strings.
If there is no common prefix, return an empty string.
=end

# If the array is empty, return an empty string
# Sort the array
# Compare the first and last strings in the sorted array
# Find the common prefix between the first and last strings

# Solution:
def longest_common_prefix(strs)
  return "" if strs.empty?
  strs.sort!
  first, last = strs.first, strs.last
  i = 0
  while i < first.length && first[i] == last[i]
    i += 1
  end
  first[0...i]
end

# Edge Cases/Tests:
puts longest_common_prefix(["flower","flow","flight"]) # "fl"
puts longest_common_prefix(["dog","racecar","car"]) # ""
puts longest_common_prefix(["interspecies","interstellar","interstate"]) # "inters"
puts longest_common_prefix(["throne","dungeon"]) # ""
puts longest_common_prefix(["throne","throne"]) # "throne"
puts longest_common_prefix([]) # ""



#* 9. Valid Anagram
puts "\n\n9. Valid Anagram: "

=begin
Description: Given two strings s and t, write a function to determine if t is an anagram of s.
=end

# If the lengths of the strings are not equal, return false
# Sort both strings
# Compare the sorted strings

# Solution:
def is_anagram(s, t)
  return false if s.length != t.length
  s.chars.sort == t.chars.sort
end

# Edge Cases/Tests:
puts is_anagram("anagram", "nagaram") # true
puts is_anagram("rat", "car") # false
puts is_anagram("a", "a") # true
puts is_anagram("ab", "ba") # true
puts is_anagram("abc", "cba") # true
puts is_anagram("abcd", "abc") # false



#* 10. Group Anagrams
puts "\n\n10. Group Anagrams: "

=begin
Description: Given an array of strings, group anagrams together.
=end

# Initialize a hash to store the groups of anagrams
# Iterate through the array of strings
# For each string, sort the characters and use the sorted string as the key in the hash
# Append the original string to the list of anagrams for that key
# Return the values of the hash

# Solution:
def group_anagrams(strs)
  groups = Hash.new { |hash, key| hash[key] = [] }
  strs.each do |str|
    sorted_str = str.chars.sort.join
    groups[sorted_str] << str
  end
  groups.values
end

# Edge Cases/Tests:
puts group_anagrams(["eat", "tea", "tan", "ate", "nat", "bat"]).inspect # [["eat", "tea", "ate"], ["tan", "nat"], ["bat"]]
puts group_anagrams([""]).inspect # [[""]]
puts group_anagrams(["a"]).inspect # [["a"]]
puts group_anagrams(["ab", "ba", "abc", "cba", "bca"]).inspect # [["ab", "ba"], ["abc", "cba", "bca"]]
puts group_anagrams([]).inspect # []
puts group_anagrams(["a", "b", "c"]).inspect # [["a"], ["b"], ["c"]]



#* 11. Search Insert Position
puts "\n\n11. Search Insert Position: "

=begin
  Description: Given a sorted array and a target value, return the index if the target is found.
  If not, return the index where it would be if it were inserted in order.
=end

# Initialize two pointers, left and right, to the start and end of the array
# While left is less than or equal to right
# Calculate the middle index
# If the middle element is equal to the target, return the middle index
# If the middle element is less than the target, move the left pointer to mid + 1
# Otherwise, move the right pointer to mid - 1
# Return the left pointer

# Solution:
def search_insert(nums, target)
  left, right = 0, nums.length - 1
  while left <= right
    mid = (left + right) / 2
    if nums[mid] == target
      return mid
    elsif nums[mid] < target
      left = mid + 1
    else
      right = mid - 1
    end
  end
  left
end

# Edge Cases/Tests:
puts search_insert([1,3,5,6], 5) # 2
puts search_insert([1,3,5,6], 2) # 1
puts search_insert([1,3,5,6], 7) # 4
puts search_insert([1,3,5,6], 0) # 0
puts search_insert([], 5) # 0
puts search_insert([1], 0) # 0



#* 12. Length of last word
puts "n\n\n12. Length of last word: "

=begin
Description: Given a string s consisting of words and spaces, return the length of the last word in the string.
=end

# Split the string by spaces
# Return the length of the last word

# Solution:
def length_of_last_word(s)
  s.split.last.length
end

# Edge Cases/Tests:
puts length_of_last_word("Hello World") # 5
puts length_of_last_word("   fly me   to   the moon  ") # 4
puts length_of_last_word("luffy is still joyboy") # 6
puts length_of_last_word("a") # 1
puts length_of_last_word("a ") # 1
puts length_of_last_word(" ") # 0



#* 13. Plus One
puts "\n\n13. Plus One: "

=begin
Description: Given a non-empty array of digits representing a non-negative integer, increment one to the integer.
=end

# Iterate from the end of the array to the beginning
# If the current digit is less than 9, increment it and return the array
# If the current digit is 9, set it to 0
# If all digits are 9, prepend 1 to the array

# Solution:
def plus_one(digits)
  (digits.length - 1).downto(0) do |i|
    if digits[i] < 9
      digits[i] += 1
      return digits
    end
    digits[i] = 0
  end
  [1] + digits
end

# Edge Cases/Tests:
puts plus_one([1,2,3]).inspect # [1, 2, 4]
puts plus_one([4,3,2,1]).inspect # [4, 3, 2, 2]
puts plus_one([9]).inspect # [1, 0]
puts plus_one([9,9,9]).inspect # [1, 0, 0, 0]
puts plus_one([0]).inspect # [1]
puts plus_one([1,0,0,0]).inspect # [1, 0, 0, 1]



#* 14. Add Binary
puts "\n\n14. Add Binary: "

=begin
Description: Given two binary strings, return their sum (also a binary string).
=end

# Initialize two pointers to the end of the strings and a carry variable
# Iterate while there are digits left in either string or there is a carry
# Calculate the sum of the current digits and the carry
# Append the least significant bit of the sum to the result
# Update the carry to be the most significant bit of the sum
# Reverse the result and join it into a string

# Solution:
def add_binary(a, b)
  i, j, carry, result = a.length - 1, b.length - 1, 0, []
  while i >= 0 || j >= 0 || carry > 0
    sum = carry
    sum += a[i].to_i if i >= 0
    sum += b[j].to_i if j >= 0
    result << (sum % 2).to_s
    carry = sum / 2
    i -= 1
    j -= 1
  end
  result.reverse.join
end

# Edge Cases/Tests:
puts add_binary("11", "1") # "100"
puts add_binary("1010", "1011") # "10101"
puts add_binary("0", "0") # "0"
puts add_binary("1111", "1111") # "11110"
puts add_binary("1", "0") # "1"
puts add_binary("110", "110") # "1100"



#* 15. Sqrt(x)
puts "\n\n15. Sqrt(x): "

=begin
Description: Given a non-negative integer x, compute and return the square root of x.
=end

# Initialize two pointers, left and right, to 0 and x
# While left is less than or equal to right
# Calculate the middle index
# If the square of the middle index is equal to x, return the middle index
# If the square of the middle index is less than x, move the left pointer to mid + 1
# Otherwise, move the right pointer to mid - 1
# Return the right pointer

# Solution:
def my_sqrt(x)
  left, right = 0, x
  while left <= right
    mid = (left + right) / 2
    if mid * mid == x
      return mid
    elsif mid * mid < x
      left = mid + 1
    else
      right = mid - 1
    end
  end
  right
end

# Edge Cases/Tests:
puts my_sqrt(4) # 2
puts my_sqrt(8) # 2
puts my_sqrt(0) # 0
puts my_sqrt(1) # 1
puts my_sqrt(16) # 4
puts my_sqrt(25) # 5



#* 16. Remove Duplicates from Sorted Array
puts "\n\n16. Remove Duplicates from Sorted Array: "

=begin
Description: Given a sorted array nums, remove the duplicates in-place such that each element appears
only once and returns the new length.
=end

# Initialize a pointer to keep track of the unique elements
# Iterate through the array
# If the current element is not equal to the last unique element, update the array and increment the pointer
# Return the pointer

# Solution:
def remove_duplicates(nums)
  return 0 if nums.empty?
  i = 0
  (1...nums.length).each do |j|
    if nums[j] != nums[i]
      i += 1
      nums[i] = nums[j]
    end
  end
  i + 1
end

# Edge Cases/Tests:
puts remove_duplicates([1,1,2]) # 2
puts remove_duplicates([0,0,1,1,1,2,2,3,3,4]) # 5
puts remove_duplicates([]) # 0
puts remove_duplicates([1,2,3,4,5]) # 5
puts remove_duplicates([1,1,1,1,1]) # 1
puts remove_duplicates([1,2,2,3,4,4,5,5,5,6]) # 6



#* 17. Maximum Depth of Binary Tree
puts "17. Maximum Depth of Binary Tree: "

=begin
Description: Given the root of a binary tree, return its maximum depth.
=end

# If the root is nil, return 0
# Recursively calculate the maximum depth of the left and right subtrees
# Return the maximum of the left and right depths plus 1

# Solution:
class TreeNode
  attr_accessor :val, :left, :right
  def initialize(val = 0, left = nil, right = nil)
    @val = val
    @left = left
    @right = right
  end
end

def max_depth(root)
  return 0 if root.nil?
  left_depth = max_depth(root.left)
  right_depth = max_depth(root.right)
  [left_depth, right_depth].max + 1
end

# Edge Cases/Tests:
root = TreeNode.new(3, TreeNode.new(9), TreeNode.new(20, TreeNode.new(15), TreeNode.new(7)))
puts max_depth(root) # 3

root = TreeNode.new(1, nil, TreeNode.new(2))
puts max_depth(root) # 2

root = nil
puts max_depth(root) # 0

root = TreeNode.new(1)
puts max_depth(root) # 1

root = TreeNode.new(1, TreeNode.new(2, TreeNode.new(3, TreeNode.new(4, TreeNode.new(5)))))
puts max_depth(root) # 5

root = TreeNode.new(1, TreeNode.new(2), TreeNode.new(3, TreeNode.new(4), TreeNode.new(5)))
puts max_depth(root) # 3



#* 18. Symmetric Tree
puts "18. Symmetric Tree: "

=begin
Description: Given the root of a binary tree, check whether it is a mirror of itself (i.e., symmetric around its center).
=end

# Define a helper function to check if two trees are mirror images
# If both trees are nil, return true
# If one tree is nil and the other is not, return false
# Check if the values of the current nodes are equal and recursively check the left subtree of one tree with the right subtree of the other tree and vice versa

# Solution:
class TreeNode
  attr_accessor :val, :left, :right
  def initialize(val = 0, left = nil, right = nil)
    @val = val
    @left = left
    @right = right
  end
end

def is_symmetric(root)
  return true if root.nil?
  is_mirror(root.left, root.right)
end

def is_mirror(t1, t2)
  return true if t1.nil? && t2.nil?
  return false if t1.nil? || t2.nil?
  t1.val == t2.val && is_mirror(t1.right, t2.left) && is_mirror(t1.left, t2.right)
end

# Edge Cases/Tests:
root = TreeNode.new(1, TreeNode.new(2, TreeNode.new(3), TreeNode.new(4)), TreeNode.new(2, TreeNode.new(4), TreeNode.new(3)))
puts is_symmetric(root) # true

root = TreeNode.new(1, TreeNode.new(2, nil, TreeNode.new(3)), TreeNode.new(2, nil, TreeNode.new(3)))
puts is_symmetric(root) # false

root = nil
puts is_symmetric(root) # true

root = TreeNode.new(1)
puts is_symmetric(root) # true

root = TreeNode.new(1, TreeNode.new(2), TreeNode.new(2))
puts is_symmetric(root) # true

root = TreeNode.new(1, TreeNode.new(2, TreeNode.new(3)), TreeNode.new(2, TreeNode.new(3)))
puts is_symmetric(root) # false



#* 19. Convert Sorted Array to Binary Search Tree
puts "\n\n19. Convert Sorted Array to Binary Search Tree: "

=begin
Description: Given an integer array where the elements
are sorted in ascending order, convert it to a height-balanced binary search tree.
=end

# Define a helper function to construct the BST
# If the start index is greater than the end index, return nil
# Calculate the middle index
# Create a new tree node with the middle element as the root
# Recursively construct the left and right subtrees using the elements before and after the middle element

# Solution:
class TreeNode
  attr_accessor :val, :left, :right
  def initialize(val = 0, left = nil, right = nil)
    @val = val
    @left = left
    @right = right
  end
end

def sorted_array_to_bst(nums)
  return nil if nums.empty?
  helper(nums, 0, nums.length - 1)
end

def helper(nums, left, right)
  return nil if left > right
  mid = (left + right) / 2
  node = TreeNode.new(nums[mid])
  node.left = helper(nums, left, mid - 1)
  node.right = helper(nums, mid + 1, right)
  node
end

# Edge Cases/Tests:
def print_tree(node)
  return [] if node.nil?
  [node.val] + print_tree(node.left) + print_tree(node.right)
end

puts print_tree(sorted_array_to_bst([-10, -3, 0, 5, 9])).inspect # [0, -3, -10, 9, 5]
puts print_tree(sorted_array_to_bst([1, 2, 3, 4, 5, 6, 7])).inspect # [4, 2, 1, 3, 6, 5, 7]
puts print_tree(sorted_array_to_bst([])).inspect # []
puts print_tree(sorted_array_to_bst([1])).inspect # [1]
puts print_tree(sorted_array_to_bst([1, 2])).inspect # [1, 2]
puts print_tree(sorted_array_to_bst([1, 2, 3])).inspect # [2, 1, 3]



#* 20. Balanced Binary Tree
puts "\n\n20. Balanced Binary Tree: "

=begin
Description: Given a binary tree, determine if it is height-balanced. A height-balanced binary tree is
defined as a binary tree in which the left and right subtrees of every node differ in height by no more
than 1.
=end

# Define a helper function to calculate the height of a tree
# If the tree is nil, return 0
# Recursively calculate the height of the left and right subtrees
# If the difference in height is greater than 1, return -1
# Otherwise, return the maximum height of the left and right subtrees plus 1
# In the main function, check if the height of the tree is -1

# Solution:
class TreeNode
  attr_accessor :val, :left, :right
  def initialize(val = 0, left = nil, right = nil)
    @val = val
    @left = left
    @right = right
  end
end

def is_balanced(root)
  return true if check_height(root) != -1
end

def check_height(node)
  return 0 if node.nil?
  left_height = check_height(node.left)
  return -1 if left_height == -1
  right_height = check_height(node.right)
  return -1 if right_height == -1
  return -1 if (left_height - right_height).abs > 1
  [left_height, right_height].max + 1
end

# Edge Cases/Tests:
root = TreeNode.new(3, TreeNode.new(9), TreeNode.new(20, TreeNode.new(15), TreeNode.new(7)))
puts is_balanced(root) # true

root = TreeNode.new(1, TreeNode.new(2, TreeNode.new(3, TreeNode.new(4), TreeNode.new(4)), TreeNode.new(3)), TreeNode.new(2))
puts is_balanced(root) # false

root = nil
puts is_balanced(root) # true

root = TreeNode.new(1)
puts is_balanced(root) # true

root = TreeNode.new(1, TreeNode.new(2), TreeNode.new(2, TreeNode.new(3), TreeNode.new(3, TreeNode.new(4), TreeNode.new(4))))
puts is_balanced(root) # false

root = TreeNode.new(1, TreeNode.new(2, TreeNode.new(3, TreeNode.new(4), TreeNode.new(4)), TreeNode.new(3)), TreeNode.new(2))
puts is_balanced(root) # true
