def fibonacci(n)
  if n < 2
    n
  else
    fibonacci(n-1) + fibonacci(n-2)
  end
end

n = 10

puts "Fibonacci sequence:"
n.times do |i|
  print fibonacci(i)
  print " "
end



# Iterative approach
# def fibonacci(n)
#   a = 0
#   b = 1

#   n.times do
#     tmp = a
#     a = b
#     b = tmp + a
#   end

#   a
# end


def fibonacci(n)
  if n < 2
    n
  else
    fibonacci(n - 1) + fibonacci(n - 2)
  end
end

def fibonacci_sequence(n)
  (0...n).map { |i| fibonacci(i) }
end

n = 10
puts "Fibonacci sequence:"
puts fibonacci_sequence(n).join(" ")
