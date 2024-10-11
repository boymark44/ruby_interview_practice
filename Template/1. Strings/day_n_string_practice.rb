#* 1. First Non-Repeated Character
puts "1. First Non-Repeated Character: "

=begin
  Write a method first_non_repeated that takes a string and returns the first character that
  does not repeat. If all characters repeat, return nil.
=end

#* Solution: Using shortcut approach.
def first_non_repeated(string)



end


puts first_non_repeated("aabbccddeffg") # => "g"
puts first_non_repeated("aabbcc") # => nil
puts first_non_repeated("swiss") # => "w"


#* Solution: Using custom approach.
def first_non_repeated(string)



end


puts first_non_repeated("aabbccddeffg") # => "g"
puts first_non_repeated("aabbcc") # => nil
puts first_non_repeated("swiss") # => "w"




#* 2. Find All Permutations of a String
puts "\n\n2. Find All Permutations of a String: "

=begin
  Write a method find_permutations that takes a string and returns an array of all possible
  permutations of its character.
=end


#* Solution: Using shortcut approach.
def find_permutations(string)



end


puts find_permutations("abc").inspect # => ["abc", "acb", "bac", "bca", "cab", "cba"]
puts find_permutations("ab").inspect # => ["ab", "ba"]
puts find_permutations("a").inspect # => ["a"]


#* Solution: Using custom approach.
def find_permutations(string)



end


puts find_permutations("abc").inspect # => ["abc", "acb", "bac", "bca", "cab", "cba"]
puts find_permutations("ab").inspect # => ["ab", "ba"]
puts find_permutations("a").inspect # => ["a"]



#* 3. Count Words in a String
puts "\n\n3. Count Words in a String: "

=begin
  Write a method count_words that takes a string and returns the number of words in the string.
  Words are considerd sequences of chracters separated by spaces.
=end


#* Solution: Using shortcut approach.
def count_words(string)



end


puts count_words("Hello, this is a test.") # => 5
puts count_words("OneWord") # => 1
puts count_words(" ") # => 0


#* Solution: Using custom approach.
def count_words(string)



end


puts count_words("Hello, this is a test.") # => 5
puts count_words("OneWord") # => 1
puts count_words(" ") # => 0



#* 4. Count Vowels
puts "\n\n4. Count Vowels: "

=begin
  Write a method count_vowels that returns the number of vowels in a string. Assume the input
  is a single word and ignore case.
=end


#* Solution: Using shortcut approach.
def count_vowels(string)



end


puts count_vowels("Hello") # => 2
puts count_vowels("Ruby") # => 1
puts count_vowels("Sky") # => 0


#* Solution: Using custom approach.
def count_vowels(string)



end


puts count_vowels("Hello") # => 2
puts count_vowels("Ruby") # => 1
puts count_vowels("Sky") # => 0



#* 5. Capitalize Every Words
puts "\n\n5. Capitalize Every Words: "

=begin
  Write a capitalize_words method that takes a string and returns a new string where every word
  is capitalized.
=end


#* Solution: Using shortcut approach.
def capitalize_words(string)



end

puts capitalize_words("hello world") # => "Hello World"
puts capitalize_words("ruby is fun") # => "Ruby Is Fun"
puts capitalize_words("capitalize this") # => "Capitalize This"


#* Solution: Using custom approach.
def capitalize_words(string)



end

puts capitalize_words("hello world") # => "Hello World"
puts capitalize_words("ruby is fun") # => "Ruby Is Fun"
puts capitalize_words("capitalize this") # => "Capitalize This"



#* 6. Find All Unique Characters
puts "\n\n6. Find All Unique Characters: "

=begin
  Write a method unique_characters that takes a string and returns a new string containing only
  the characters that appear once in the original string.
=end


#* Solution: Using shortcut appraoch.
def unique_characters(string)



end

puts unique_characters("hello world") # => "he wrd"
puts unique_characters("abcdef") # => "abcdeg"
puts unique_characters("aabbcc") # => ""


#* Solution: Using custom approach.
def unique_characters(string)



end

puts unique_characters("hello world") # => "he wrd"
puts unique_characters("abcdef") # => "abcdeg"
puts unique_characters("aabbcc") # => ""



#* 7. Remove Duplicates From String
puts "\n\n7. Remove Duplicates From String: "

=begin
  Write a remove_duplicates method that removes duplicate characters from a string
  while preserving the original order.
=end


#* Solution: Using shortcut approach.
def remove_duplicates(string)



end

puts remove_duplicates("hello") # => "helo"
puts remove_duplicates("banana") # => "ban"
puts remove_duplicates("Ruby") # => "Ruby"


#* Solution: Using custom approach.
def remove_duplicates(string)



end

puts remove_duplicates("hello") # => "helo"
puts remove_duplicates("banana") # => "ban"
puts remove_duplicates("Ruby") # => "Ruby"



#* 8. Anagram Check
puts "\n\n8. Anagram Check: "

=begin
  Write a are_anagrams method that takes two strings and returns true if they are anagrams,
  and false otherwise.
=end


#* Solution: Using shortcut approach.
def are_anagrams(string1, string2)



end

puts are_anagrams("listen", "silent") # => true
puts are_anagrams("hello", "world") # => false
puts are_anagrams("evil", "vile") # =>  true


#* Solution: Using custom approach.
def are_anagrams(string1, string2)



end

puts are_anagrams("listen", "silent") # => true
puts are_anagrams("hello", "world") # => false
puts are_anagrams("evil", "vile") # =>  true




#* 9. Find Longest Palindromic Substring
puts "\n\n"

=begin
  Write a method palindromic_substring that takes a string and returns the longest
  substring that is a palindrome. If there are multiple palindromes of the same length,
  returns the first one.
=end


#* Solution: Using shortcut approach.
def palindromic_substring(string)



end

puts palindromic_substring("babad") # => "bab" or "aba"
puts palindromic_substring("cbbd") # => "bb"
puts palindromic_substring("racecar") # => "racecar"


#* Solution: Using custom approach.
def palindromic_substring(string)



end

puts palindromic_substring("babad") # => "bab" or "aba"
puts palindromic_substring("cbbd") # => "bb"
puts palindromic_substring("racecar") # => "racecar"



#* 10. Remove Whitespaces
puts "\n\n10. Remove Whitespaces: "

=begin
  Write a remove_whitespaces method that removes all whitespaces from a string.
=end


#* Solution: Using shortcut approach.
def remove_whitespaces(string)



end

puts remove_whitespaces("hello world") # => "helloworld"
puts remove_whitespaces("  spaced out  ") # => "spacedout"
puts remove_whitespaces("no_spaces") # => "no_spaces"


#* Solution: Using custom approach.
def remove_whitespaces(string)



end

puts remove_whitespaces("hello world") # => "helloworld"
puts remove_whitespaces("  spaced out  ") # => "spacedout"
puts remove_whitespaces("no_spaces") # => "no_spaces"
