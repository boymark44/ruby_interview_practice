#* Exercise 1: Basic Class Creation
puts "\n\nExercise 1: Basic Class Creation. "

=begin
  Create a Book class with the following specifications:
  - It should have attributes for title, author, and pages
  - Implement a constructor (initialize method) that sets these attributes
  - Create a to_s method that returns a string representation of the book
  - The pages attribute should always be stored as an integer
  - Implement getter and setter methods for all attributes
  - Ensure the class can handle edge cases like empty strings or zero pages
=end

#* Solution:
class Book
  attr_reader :title, :author, :pages

  def initialize(title, author, pages)
    self.title = title
    self.author = author
    self.pages = pages
  end

  def title=(value)
    @title = value.to_s
  end

  def author=(value)
    @author = value.to_s
  end

  def pages=(value)
    @pages = [value.to_i, 0].max
  end

  def to_s
    "#{@title} by #{@author} (#{@pages} pages)"
  end
end

#* Edge case: Book with empty title, author, or zero pages
empty_book = Book.new("", "", 0)
puts empty_book.to_s



#* Exercise 2: Inheritance
puts "\n\nExercise 2: Inheritance. "

=begin
  Create an inheritance hierarchy for animals with the following requirements:
  - Implement an Animal base class with a speak method that returns "Some sound"
  - Create Dog and Cat subclasses that inherit from Animal
  - Override the speak method in Dog to return "Woof!" and in Cat to return "Meow!"
  - Demonstrate polymorphism by calling speak on different animal objects
  - Implement an additional subclass of your choice to show extensibility
=end

#* Solution:
class Animal
  def speak
    "Some sound"
  end
end

class Dog < Animal
  def speak
    "Woof!"
  end
end

class Cat < Animal
  def speak
    "Meow!"
  end
end

#* Edge case: Create a new animal subclass
class Fish < Animal
  def speak
    "Blub!"
  end
end

#* Demonstrate polymorphism
animals = [Animal.new, Dog.new, Cat.new, Fish.new]
animals.each { |animal| puts animal.speak }



#* Exercise 3: Encapsulation
puts "\n\nExercise 3: Encapsulation: "

=begin
  Implement a BankAccount class with the following specifications:
  - The class should have a private balance attribute
  - Implement methods to deposit and withdraw money
  - Create a method to check the current balance
  - Ensure that the balance cannot be accessed or modified directly from outside the class
  - Implement error checking for invalid deposits or withdrawals (e.g., negative amounts)
  - Add a method to prevent overdrawing the account
=end

#* Solution:
class BankAccount
  def initialize(initial_balance = 0)
    @balance = [initial_balance, 0].max
  end

  def deposit(amount)
    if amount > 0
      @balance += amount
      true
    else
      false
    end
  end

  def withdraw(amount)
    if amount > 0 && amount <= @balance
      @balance -= amount
      true
    else
      false
    end
  end

  def check_balance
    @balance
  end

  private

  attr_reader :balance
end

#* Edge cases: Deposit and withdraw with negative amounts
account = BankAccount.new(100)
puts account.deposit(-50)  # Should return false
puts account.withdraw(-30) # Should return false
puts account.withdraw(150) # Should return false (overdraw attempt)
puts account.check_balance # Should still be 100



#* Exercise 4: Polymorphism
puts "\n\nExercise 4: Polymorphism: "

=begin
  Create a shape hierarchy to demonstrate polymorphism:
  - Implement a Shape base class with an area method that raises a NotImplementedError
  - Create Circle and Rectangle subclasses that inherit from Shape
  - Override the area method in each subclass with the correct area calculation
  - Demonstrate polymorphism by calling the area method on different shape objects
  - Implement error handling for invalid input (e.g., negative radius or dimensions)
  - Create an array of different shapes and calculate the total area
=end

#* Solution:
class Shape
  def area
    raise NotImplementedError, "Subclass must implement abstract method"
  end
end

class Circle < Shape
  def initialize(radius)
    @radius = radius
    raise ArgumentError, "Radius must be positive" if @radius <= 0
  end

  def area
    Math::PI * @radius ** 2
  end
end

class Rectangle < Shape
  def initialize(width, height)
    @width = width
    @height = height
    raise ArgumentError, "Width and height must be positive" if @width <= 0 || @height <= 0
  end

  def area
    @width * @height
  end
end

#* Demonstrate polymorphism and error handling
shapes = [
  Circle.new(5),
  Rectangle.new(4, 6),
  Circle.new(3),
  Rectangle.new(2, 8)
]

total_area = shapes.sum(&:area)
puts "Total area of all shapes: #{total_area}"

#* Edge case: Try to create a shape with invalid dimensions
begin
  Circle.new(-1)
rescue ArgumentError => e
  puts "Caught error: #{e.message}"
end



#* Exercise 5: Class Methods and Variables
puts "\n\nExercise 5: Class Methods and Variables: "

=begin
  Implement a Counter class with the following features:
  - Use a class variable to keep track of the number of Counter instances created
  - Implement a class method to retrieve the current count
  - Create an instance method that increments the count when a new instance is created
  - Add a class method to reset the count to zero
  - Implement a method to retrieve the creation order of each instance
  - Ensure thread safety for the counter in a multi-threaded environment
=end

class Counter
  @@count = 0
  @@mutex = Mutex.new

  def initialize
    @@mutex.synchronize do
      @@count += 1
      @creation_order = @@count
    end
  end

  def self.count
    @@mutex.synchronize { @@count }
  end

  def self.reset
    @@mutex.synchronize { @@count = 0 }
  end

  def creation_order
    @creation_order
  end
end

#* Usage and edge cases
5.times { Counter.new }
puts Counter.count  # Should output 5
Counter.reset
puts Counter.count  # Should output 0

counters = 3.times.map { Counter.new }
counters.each { |c| puts "Counter #{c.object_id} creation order: #{c.creation_order}" }



#* Exercise 6: Modules and Mixins
puts "\n\nExercise 6: Modules and Mixins: "

=begin
  Create a logging system using modules and mixins:
  - Implement a Loggable module with a log method that prints a timestamped message
  - Create multiple classes (e.g., User, Product, Order) that include the Loggable module
  - Demonstrate how the log method can be used in different contexts for each class
  - Implement a LogFormatter module that can be used to format log messages
  - Show how to use module_function to create both instance and module methods
  - Create a custom logger that aggregates logs from multiple sources
=end

#* Solution:
module LogFormatter
  module_function

  def format(message, severity = :info)
    "[#{Time.now}] #{severity.upcase}: #{message}"
  end
end

module Loggable
  def log(message, severity = :info)
    puts LogFormatter.format(message, severity)
  end
end

class User
  include Loggable

  def initialize(name)
    @name = name
    log("User #{@name} created")
  end
end

class Product
  include Loggable

  def initialize(name, price)
    @name = name
    @price = price
    log("Product #{@name} created with price $#{@price}", :debug)
  end
end

class Order
  include Loggable

  def initialize(user, products)
    @user = user
    @products = products
    log("New order created for #{@user} with #{@products.length} products", :info)
  end
end

class AggregateLogger
  def initialize(*sources)
    @sources = sources
  end

  def log(message, severity = :info)
    @sources.each { |source| source.log(message, severity) }
  end
end

# Usage
user = User.new("Alice")
product = Product.new("Widget", 10.99)
order = Order.new(user, [product])

aggregate_logger = AggregateLogger.new(user, product, order)
aggregate_logger.log("This message will be logged by all sources", :warning)



#* Exercise 7: Operator Overloading
puts "\n\nExercise 7: Operator Overloading: "

=begin
  Implement a Money class with the following specifications:
  - The class should have amount and currency attributes
  - Overload the + and - operators to allow arithmetic operations between Money objects
  - Ensure that operations are only allowed between Money objects of the same currency
  - Implement comparison operators (==, <, >, <=, >=) for Money objects
  - Add a method to convert between different currencies given an exchange rate
  - Implement the coerce method to allow operations with numeric values
=end

#* Solution:
class Money
  include Comparable

  attr_reader :amount, :currency

  def initialize(amount, currency)
    @amount = amount.to_f
    @currency = currency.to_s.upcase
  end

  def +(other)
    operate_with(other, :+)
  end

  def -(other)
    operate_with(other, :-)
  end

  def <=>(other)
    raise ArgumentError, "Cannot compare different currencies" unless currency == other.currency
    amount <=> other.amount
  end

  def convert_to(new_currency, exchange_rate)
    Money.new(amount * exchange_rate, new_currency)
  end

  def coerce(other)
    [Money.new(other, currency), self]
  end

  def to_s
    "#{amount} #{currency}"
  end

  private

  def operate_with(other, operator)
    other = Money.new(other, currency) unless other.is_a?(Money)
    raise ArgumentError, "Cannot operate on different currencies" unless currency == other.currency
    Money.new(amount.send(operator, other.amount), currency)
  end
end

#* Usage and edge cases
usd_10 = Money.new(10, "USD")
usd_20 = Money.new(20, "USD")
eur_15 = Money.new(15, "EUR")

puts usd_10 + usd_20  # 30.0 USD
puts usd_20 - usd_10  # 10.0 USD
puts usd_10 < usd_20  # true

begin
  usd_10 + eur_15
rescue ArgumentError => e
  puts "Caught error: #{e.message}"
end

puts usd_10 + 5  # 15.0 USD
puts usd_10.convert_to("EUR", 0.85)  # 8.5 EUR



#* Exercise 8: Method Missing
puts "\n\nExercise 8: Method Missing: "

=begin
  Create a flexible Struct-like class using method_missing:
  - Implement a class that can dynamically add and retrieve attributes
  - Use method_missing to handle undefined method calls
  - Implement respond_to_missing? for proper method introspection
  - Allow both getter and setter methods for dynamic attributes
  - Add a method to list all defined attributes and their values
  - Implement type checking for attribute values (optional)
=end

#* Solution:
class FlexibleStruct
  def initialize
    @attributes = {}
  end

  def method_missing(name, *args)
    name_str = name.to_s
    if name_str.end_with?("=")
      @attributes[name_str.chop] = args.first
    else
      @attributes[name_str]
    end
  end

  def respond_to_missing?(name, include_private = false)
    true
  end

  def attributes
    @attributes.dup
  end

  def set_attribute(name, value, type = nil)
    if type.nil? || value.is_a?(type)
      @attributes[name.to_s] = value
    else
      raise TypeError, "Expected #{type}, got #{value.class}"
    end
  end
end

#* Usage and edge cases
flexible = FlexibleStruct.new
flexible.name = "John"
flexible.age = 30
puts flexible.name  # John
puts flexible.age   # 30
puts flexible.undefined_attribute.nil?  # true

puts flexible.attributes  # {"name"=>"John", "age"=>30}

flexible.set_attribute(:score, 95, Integer)
begin
  flexible.set_attribute(:grade, "A", Integer)
rescue TypeError => e
  puts "Caught error: #{e.message}"
end



#* Exercise 9: Lazy Enumerators
puts "\n\nExercise 9: Lazy Enumerators: "

=begin
  Implement a prime number generator using lazy enumerators:
  - Create a method that returns an infinite lazy enumerator of prime numbers
  - Use the lazy enumerator to efficiently find the first 100 prime numbers
  - Implement a method to find all prime numbers within a given range
  - Add a feature to calculate the sum of the first N prime numbers
  - Demonstrate the memory efficiency of your implementation for large values
=end

#* Solution:
require 'prime'

class PrimeGenerator
  def self.lazy_primes
    Prime.lazy
  end

  def self.first_n_primes(n)
    lazy_primes.first(n)
  end

  def self.primes_in_range(start, finish)
    lazy_primes.drop_while { |prime| prime < start }.take_while { |prime| prime <= finish }
  end

  def self.sum_of_first_n_primes(n)
    lazy_primes.first(n).sum
  end
end

#* Usage example
puts PrimeGenerator.first_n_primes(10).to_a
puts PrimeGenerator.primes_in_range(10, 30).to_a
puts PrimeGenerator.sum_of_first_n_primes(1000)



#* Exercise 10: Domain Specific Language (DSL)
puts "\n\nExercise 17: Domain Specific Language (DSL): "

=begin
  Create a simple DSL for describing and executing recipes:
  - Design a DSL that allows defining ingredients, steps, and cooking time
  - Implement a Recipe class that can be created using the DSL
  - Add methods to display the recipe, scale ingredients, and estimate total time
  - Include error handling for missing ingredients or invalid quantities
  - Implement a feature to convert between different units of measurement
  - Create several example recipes using your DSL to demonstrate its usage
=end

class Recipe
  attr_reader :name, :ingredients, :steps, :cooking_time

  def initialize(name, &block)
    @name = name
    @ingredients = []
    @steps = []
    @cooking_time = 0
    instance_eval(&block)
  end

  def ingredient(name, quantity, unit)
    @ingredients << { name: name, quantity: quantity, unit: unit }
  end

  def step(description)
    @steps << description
  end

  def cook_for(time, unit = :minutes)
    @cooking_time = time * (unit == :hours ? 60 : 1)
  end

  def display
    puts "Recipe: #{@name}"
    puts "Ingredients:"
    @ingredients.each { |ing| puts "- #{ing[:quantity]} #{ing[:unit]} #{ing[:name]}" }
    puts "Steps:"
    @steps.each_with_index { |step, index| puts "#{index + 1}. #{step}" }
    puts "Cooking time: #{@cooking_time} minutes"
  end

  def scale(factor)
    @ingredients.each { |ing| ing[:quantity] *= factor }
  end
end

#* Usage example
pancakes = Recipe.new("Pancakes") do
  ingredient "Flour", 1.5, :cups
  ingredient "Milk", 1.25, :cups
  ingredient "Eggs", 2, :units
  step "Mix dry ingredients"
  step "Add wet ingredients and mix until smooth"
  step "Cook on a griddle until golden brown"
  cook_for 20
end

pancakes.display
pancakes.scale(2)
puts "\nScaled recipe:"
pancakes.display
