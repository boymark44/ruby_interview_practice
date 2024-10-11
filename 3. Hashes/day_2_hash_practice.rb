#* 1. Find Key by Value
puts "\n\n1. Find Key by Value: "

=begin
  Write a method find_key_by_value that takes a hash and a value, and returns the first key
  that maps to that value. if no key maps to the value, return nil.
=end


#* Solution: Using shortcut approach.
def find_key_by_value(hash, value)
  hash.key(value)
end

hash = {a: 1, b: 2, c: 3}
p find_key_by_value(hash, 2) # => b
p find_key_by_value(hash, 4) # => nil
p find_key_by_value({}, 5)   # => nil
p find_key_by_value({x: 1, y: 1}, 1) # => x (returns first key for duplicate values)


#* Solution: Using custom approach.
def find_key_by_value(hash, value)



end

hash = {a: 1, b: 2, c: 3}
p find_key_by_value(hash, 2) # => b
p find_key_by_value(hash, 4) # => nil
p find_key_by_value({}, 5)   # => nil
p find_key_by_value({x: 1, y: 1}, 1) # => x (returns first key for duplicate values)



#* 2. Merge Two Hashes
puts "\n\n2. Merge Two Hashes: "

=begin
  Write a method merge_hashes that takes two hashes and returns a new hash that merges both, where
  values from the second hash override the first.
=end


#* Solution: Using shortcut approach.
def merge_hashes(hash1, hash2)
  hash1.merge(hash2)
end

hash1 = {a: 1, b: 2}
hash2 = {b: 3, c: 4}
p merge_hashes(hash1, hash2) # => {:a=>1, :b=>3, :c=>4}
p merge_hashes({x: 10}, {y: 20}) # => {:x=>10, :y=>20}
p merge_hashes({}, {a: 1}) # => {:a=>1}
p merge_hashes({a: 1}, {}) # => {:a=>1}


#* Solution: Using custom approach.
def merge_hashes(hash1, hash2)



end

hash1 = {a: 1, b: 2}
hash2 = {b: 3, c: 4}
p merge_hashes(hash1, hash2) # => {:a=>1, :b=>3, :c=>4}
p merge_hashes({x: 10}, {y: 20}) # => {:x=>10, :y=>20}
p merge_hashes({}, {a: 1}) # => {:a=>1}
p merge_hashes({a: 1}, {}) # => {:a=>1}



#* 3. Convert Array to Hash
puts "\n\n3. Convert Array to Hash: "

=begin
  Write a method array_to_hash that takes an array and converts it to hash where each element
  becomes a key and its index becomes the value.
=end


#* Solution: Using shortcut approach.
def array_to_hash(array)
  array.each_with_index.to_h
end

array = ["apple", "banana", "cherry"]
p array_to_hash(array) # => {"apple"=>0, "banana"=>1, "cherry"=>2}
p array_to_hash([]) # => {}
p array_to_hash(["single"]) # => {"single"=>0}


#* Solution: Using custom approach.
def array_to_hash(array)



end

array = ["apple", "banana", "cherry"]
p array_to_hash(array) # => {"apple"=>0, "banana"=>1, "cherry"=>2}
p array_to_hash([]) # => {}
p array_to_hash(["single"]) # => {"single"=>0}



#* 4. Count Frequencies
puts "\n\n4. Count Frequencies: "

=begin
  Write a method count_frequencies that takes a string and returns a hash where keys are characters, and
  values are their frequency in the string.
=end


#* Solution: Using shortcut approach.
def count_frequencies(string)
  frequencies = Hash.new(0)

  string.each_char { |current_char| frequencies[current_char] += 1 }

  frequencies
end

p count_frequencies("hello") # => {"h"=>1, "e"=>1, "l"=>2, "o"=>1}
p count_frequencies("") # => {}
p count_frequencies("aaa") # => {"a"=>3}


#* Solution: Using custom approach.
def count_frequencies(string)


end

p count_frequencies("hello") # => {"h"=>1, "e"=>1, "l"=>2, "o"=>1}
p count_frequencies("") # => {}
p count_frequencies("aaa") # => {"a"=>3}



#* 5. Invert Keys and Values
puts "\n\n5. Invert Keys and Values: "

=begin
  Write a method invert_hash that takes a hash and returns a new hash where the keys and values are swapped.
=end


#* Solution: Using shortcut approach.
def invert_hash(hash)
  hash.invert()
end

hash = {a: 1, b: 2, c: 3}
p invert_hash(hash) # => {1=>:a, 2=>:b, 3=>:c}
p invert_hash({}) # => {}
p invert_hash({x: 1, y: 1}) # => {1=>:y} (last occurrence wins for duplicate values)


#* Solution: Using custom approach.
def invert_hash(hash)



end

hash = {a: 1, b: 2, c: 3}
p invert_hash(hash) # => {1=>:a, 2=>:b, 3=>:c}
p invert_hash({}) # => {}
p invert_hash({x: 1, y: 1}) # => {1=>:y} (last occurrence wins for duplicate values)


#* 6. Delete Key-Value Pair by Key
puts "\n\n6. Delete Key-Value Pair by Key: "

=begin
  Write a method delete_by_key that takes a hash and a key, and deletes the kay-value pair for that
  key from the hash.
=end


#* Solution: Using shortcut approach.
def delete_by_key(hash, key)
  hash.delete(key)
  hash
end

hash = { a: 1, b: 2, c: 3 }
p delete_by_key(hash, :b) # => {:a=>1, :c=>3}
p delete_by_key(hash, :d) # => {:a=>1, :c=>3}
p delete_by_key({}, :a) # => {}


#* Solution: Using custom approach.
def delete_by_key(hash, key)



end

hash = { a: 1, b: 2, c: 3 }
p delete_by_key(hash, :b) # => {:a=>1, :c=>3}
p delete_by_key(hash, :d) # => {:a=>1, :c=>3}
p delete_by_key({}, :a) # => {}



#* 7. Check if Key exists
puts "\n\n7. Check if Key exists: "

=begin
  Write a method key_exists? that takes a hash and a key, and returns true if the key exists, and false otherwise.
=end


#* Solution: Using shortcut approach.
def key_exists?(hash, key)
  hash.has_key?(key)
end

hash = { a: 1, b: 2 }
p key_exists?(hash, :a) # => true
p key_exists?(hash, :c) # => false
p key_exists?({}, :x) # => false


#* Solution: Using custom approach.
def key_exists?(hash, key)



end

hash = { a: 1, b: 2 }
p key_exists?(hash, :a) # => true
p key_exists?(hash, :c) # => false
p key_exists?({}, :x) # => false


#* 8. Sum of Values in a Hash
puts "\n\n8. Sum of Values in a Hash: "

=begin
  Write a method sum_values that takes a hash where all values are integers and
  returns the sum of those values.
=end


#* Solution: Using shortcut approach.
def sum_values(hash)
  hash.values.sum
end

hash = { a: 1, b: 2, c: 3 }
p sum_values(hash) # => 6
p sum_values({}) # => 0
p sum_values({x: -1, y: 1}) # => 0


#* Solution: Using custom approach.
def sum_values(hash)



end

hash = { a: 1, b: 2, c: 3 }
p sum_values(hash) # => 6
p sum_values({}) # => 0
p sum_values({x: -1, y: 1}) # => 0



#* 9. Group by length

=begin
  Write a method group_by_length that takes an array of strings and returns a hash
  where keys are lengths of the strings and values are arrays of strings with that length.
=end


#* Solution: Using shortcut approach.
def group_by_length(array)
  array.group_by { |string| string.length }
end

array = ["cat", "dog", "elephant", "ant"]
p group_by_length(array) # => {3=>["cat", "dog", "ant"], 8=>["elephant"]}
p group_by_length([]) # => {}
p group_by_length(["", "a", "bb", "ccc"]) # => {0=>[""], 1=>["a"], 2=>["bb"], 3=>["ccc"]}


#* Solution: Using custom approach.
def group_by_length(array)



end

array = ["cat", "dog", "elephant", "ant"]
p group_by_length(array) # => {3=>["cat", "dog", "ant"], 8=>["elephant"]}
p group_by_length([]) # => {}
p group_by_length(["", "a", "bb", "ccc"]) # => {0=>[""], 1=>["a"], 2=>["bb"], 3=>["ccc"]}



#* 10. Initialize Hash with Default Value

=begin
  Write a method initialize_with_default that takes an array and a default value, and returns a hash
  where the elements of the arrays are keys and all values are initialized to the default value.
=end


#* Solution: Using shortcut approach.
def initialize_with_default(array, default)

  hash = {}

  array.each { |current_key| hash[current_key] = default }

  hash
end

array = [:a, :b, :c]
p initialize_with_default(array, 0) # => {:a=>0, :b=>0, :c=>0}
p initialize_with_default([], 5) # => {}
p initialize_with_default([:x], "default") # => {:x=>"default"}


#* Solution: Using custom approach.
def initialize_with_default(array, default)



end

array = {:a, :b, :c}
p initialize_with_default(array, 0) # => {:a=>0, :b=>0, :c=>0}
p initialize_with_default([], 5) # => {}
p initialize_with_default([:x], "default") # => {:x=>"default"}



#* 11. Find Key with Maximum Value
puts "\n\n11. Find Key with Maximum Value: "

=begin
  Write a method key_with_max_value that takes a hash where the values are integers amd returns the
  key with the maximum value.
=end


#* Solution: Using shortcut approach.
def key_with_max_value(hash)
  hash.key(hash.values.max)
end

p key_with_max_value({a: 10, b: 20, c: 30}) # => c
p key_with_max_value({x: 5, y: 15, z: 10}) # => y
p key_with_max_value({}) # => nil
p key_with_max_value({a: -10, b: -5, c: -15}) # => b


#* Solution: Using custom approach.
def key_with_max_value(hash)



end

p key_with_max_value({a: 10, b: 20, c: 30}) # => c
p key_with_max_value({x: 5, y: 15, z: 10}) # => y
p key_with_max_value({}) # => nil
p key_with_max_value({a: -10, b: -5, c: -15}) # => b



#* 12. Invert a Hash
puts "\n\n12. Invert a Hash: "

=begin
  Write a method invert_hash that takes a hash and returns a new hash where the keys are the values
  and the values are the keys.
=end


#* Solution: Using shortcut approach.
def invert_hash(hash)
  hash.invert
end

puts invert_hash({a: 1, b: 2, c: 3}).inspect # => {1=>:a, 2=>:b, 3=>:c}
puts invert_hash({x: 10, y: 20}).inspect # => {10=>:x, 20=>:y}
puts invert_hash({}).inspect # => {}
puts invert_hash({a: 1, b: 1}).inspect # => {1=>:b} (last occurrence wins for duplicate values)


#* Solution: Using custom approach.
def invert_hash(hash)



end

puts invert_hash({a: 1, b: 2, c: 3}).inspect # => {1=>:a, 2=>:b, 3=>:c}
puts invert_hash({x: 10, y: 20}).inspect # => {10=>:x, 20=>:y}
puts invert_hash({}).inspect # => {}
puts invert_hash({a: 1, b: 1}).inspect # => {1=>:b} (last occurrence wins for duplicate values)



#* 13. Count Occurences of Values
puts "\n\n13. Count Occurences of Values: "

=begin
  Write a method count_occurrences that takes an array of strings and returns a hash where the keys
  are the strings and the values are the number of times they appear in the array.
=end


#* Solution: Using shortcut approach.
def count_occurrences(array)
  array.each_with_object(Hash.new(0)) { |word, hash| hash[word] += 1 }
end

puts count_occurrences(["apple", "banana", "apple", "orange"]).inspect # => {"apple"=>2, "banana"=>1, "orange"=>1}
puts count_occurrences(["a", "b", "a", "a", "c"]).inspect # => {"a"=>3, "b"=>1, "c"=>1}
puts count_occurrences([]).inspect # => {}
puts count_occurrences(["x"]).inspect # => {"x"=>1}


#* Solution: Using custom approach.
def count_occurrences(array)



end

puts count_occurrences(["apple", "banana", "apple", "orange"]).inspect # => {"apple"=>2, "banana"=>1, "orange"=>1}
puts count_occurrences(["a", "b", "a", "a", "c"]).inspect # => {"a"=>3, "b"=>1, "c"=>1}
puts count_occurrences([]).inspect # => {}
puts count_occurrences(["x"]).inspect # => {"x"=>1}



#* 14. Find Common Keys Between Two Hashes
puts "\n\n14. Find Common Keys Between Two Hashes: "

=begin
  Write a method common_keys that takes two hashes and returns an array of keys that exist in both
  hashes.
=end


#* Solution: Using shortcut approach.
def common_keys(hash1, hash2)
  hash1.keys and hash2.keys
end

puts common_keys({a: 1, b: 2}, {b: 3, c: 4}).inspect # => [:b]
puts common_keys({x: 5, y: 6}, {y: 7, z: 8}).inspect # => [:y]
puts common_keys({a: 1}, {b: 2}).inspect # => []
puts common_keys({}, {}).inspect # => []


#* Solution: Using custom approach.
def common_keys(hash1, hash2)



end

puts common_keys({a: 1, b: 2}, {b: 3, c: 4}).inspect # => [:b]
puts common_keys({x: 5, y: 6}, {y: 7, z: 8}).inspect # => [:y]
puts common_keys({a: 1}, {b: 2}).inspect # => []
puts common_keys({}, {}).inspect # => []



#* 15. Find Keys with Specific Values

=begin
  Write a method keys_with_value that takes a hash and a value, and returns an array of all keys that
  map to that specific value.
=end


#* Solution: Using shortcut approach.
def keys_with_value(hash, value)
  hash.select { |current_key, current_value| current_value == value }.keys
end

puts keys_with_value({a: 1, b: 2, c: 1}, 1).inspect # => [:a, :c]
puts keys_with_value({x: 10, y: 20, z: 10}, 10).inspect # => [:x, :z]
puts keys_with_value({a: 5, b: 6}, 7).inspect # => []
puts keys_with_value({}, 5).inspect # => []


#* Solution: Using custom approach.
def keys_with_value(hash, value)



end

puts keys_with_value({a: 1, b: 2, c: 1}, 1).inspect # => [:a, :c]
puts keys_with_value({x: 10, y: 20, z: 10}, 10).inspect # => [:x, :z]
puts keys_with_value({a: 5, b: 6}, 7).inspect # => []
puts keys_with_value({}, 5).inspect # => []
