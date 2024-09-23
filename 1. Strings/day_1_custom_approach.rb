#* 1. First Non-Repeated Character
puts "1. First Non-Repeated Character: "

=begin
  Write a method first_non_repeated that takes a string and returns the first character that
  does not repeat. If all characters repeat, return nil.
=end

#* Solution:
def first_non_repeated(string)
  char_count = Hash.new(0)

  # Count occurrences of each character
  string.each_char do |char|
    char_count[char] += 1
  end

  # Find the first character with count 1
  string.each_char do |char|
    return char if char_count[char] == 1
  end

  # If all characters repeat, return nil
  nil
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


#* Solution:
def find_permutations(string)
  return [string] if string.length <= 1

  permutations = []
  string.each_char.with_index do |char, index|
    remaining_chars = string[0...index] + string[index+1..-1]
    sub_permutations = find_permutations(remaining_chars)

    sub_permutations.each do |sub_perm|
      permutations << char + sub_perm
    end
  end

  permutations
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


#* Solution:
def count_words(string)
  words = string.strip.split(/\s+/)
  words.length
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


#* Solution:
def count_vowels(string)
  vowels = ['a', 'e', 'i', 'o', 'u']
  count = 0

  string.downcase.each_char do |char|
    count += 1 if vowels.include?(char)
  end

  count
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


#* Solution:
def capitalize_words(string)
  words = string.split(' ')
  capitalized_words = words.map { |word| word.capitalize }
  capitalized_words.join(' ')
end


#* Solution:

puts capitalize_words("hello world") # => "Hello World"
puts capitalize_words("ruby is fun") # => "Ruby Is Fun"
puts capitalize_words("capitalize this") # => "Capitalize This"



#* 6. Find All Unique Characters
puts "\n\n6. Find All Unique Characters: "

=begin
  Write a method unique_characters that takes a string and returns a new string containing only
  the characters that appear once in the original string.
=end


#* Solution:
def unique_characters(string)
  char_count = Hash.new(0)

  string.each_char do |char|
    char_count[char] += 1
  end

  unique_chars = string.chars.select { |char| char_count[char] == 1 }
  unique_chars.join
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


#* Solution:
def remove_duplicates(string)
  seen_chars = {}
  result = ""

  string.each_char do |char|
    unless seen_chars[char]
      result << char
      seen_chars[char] = true
    end
  end

  result
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


#* Solution:
def are_anagrams(string1, string2)
  char_count1 = Hash.new(0)
  char_count2 = Hash.new(0)

  string1.downcase.each_char { |char| char_count1[char] += 1 }
  string2.downcase.each_char { |char| char_count2[char] += 1 }

  char_count1 == char_count2
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


#* Solution:
def palindromic_substring(string)
  longest_palindrome = ""

  (0...string.length).each do |i|
    # Check for odd-length palindromes
    palindrome = expand_around_center(string, i, i)
    longest_palindrome = palindrome if palindrome.length > longest_palindrome.length

    # Check for even-length palindromes
    palindrome = expand_around_center(string, i, i + 1)
    longest_palindrome = palindrome if palindrome.length > longest_palindrome.length
  end

  longest_palindrome
end

def expand_around_center(string, left, right)
  while left >= 0 && right < string.length && string[left] == string[right]
    left -= 1
    right += 1
  end

  string[left + 1...right]
end

puts palindromic_substring("babad") # => "bab" or "aba"
puts palindromic_substring("cbbd") # => "bb"
puts palindromic_substring("racecar") # => "racecar"



#* 10. Remove Whitespaces
puts "\n\n10. Remove Whitespaces: "

=begin
  Write a remove_whitespaces method that removes all whitespaces from a string.
=end


#* Solution:
def remove_whitespaces(string)
  result = ""
  string.each_char do |char|
    result << char unless char.match(/\s/)
  end
  result
end

puts remove_whitespaces("hello world") # => "helloworld"
puts remove_whitespaces("  spaced out  ") # => "spacedout"
puts remove_whitespaces("no_spaces") # => "no_spaces"
