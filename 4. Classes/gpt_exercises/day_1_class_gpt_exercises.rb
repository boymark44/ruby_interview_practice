#* 1. Simple Class with Getter and Setter Methods
puts "\n\n1. Simple Class with Getter and Setter Methods: "

=begin
  Create a class Person with the following specifications:
  - It should have two attributes: name and age
  - Implement getter and setter methods for both attributes
  - Ensure that the age attribute cannot be set to a value less than 0
  - The initialize method should accept name and age as parameters
  - Implement a method to display the person's information
  - Add error handling for invalid input (e.g., negative age)
=end

#* Solution:
class Person

  # Attribute reader:
  attr_reader :name, :age

  def initialize(name, age)
    @name = name
    self.age = age
  end

  def name=(name)
    @name = name
  end

  def age=(age)
    @age = age < 0 ? 0 : age
  end

end


person = Person.new("Mark Glenn", 25)
puts person.name # => "Mark Glenn"
puts person.age # => 25

person.age = -5
puts person.age # => 0 (age cannot be negative)

person.name = "Bob"
puts person.name # => "Bob"



#* 2. Class Method for Counting Instances
puts "\n\n2. Class Method for Counting Instances: "

=begin
  Create a class Car with the following features:
  - Implement a class variable to track the number of Car instances created
  - Create a class method total_cars that returns the count of instances
  - The initialize method should increment the instance count
  - Add a method to display information about the car (e.g., make, model)
  - Implement a class method to reset the instance count to zero
  - Ensure thread safety for the instance counter in a multi-threaded environment
=end

#* Solution:
class Car
  @@total_cars = 0

  def initialize
    @@total_cars += 1
  end

  def self.total_cars
    @@total_cars
  end

end

car1 = Car.new
car2 = Car.new
car3 = Car.new

puts Car.total_cars # => 3



#* 3. Class Inheritance
puts "\n\n3. Class Inheritance: "

=begin
  Create an inheritance hierarchy for animals with these requirements:
  - Implement an Animal base class with a speak method that prints "I am an animal"
  - Create a Dog subclass that inherits from Animal
  - Override the speak method in Dog to print "Woof!"
  - Add a new method in Dog class (e.g., wag_tail) to demonstrate extending functionality
  - Implement a method in Animal to display general information about the animal
  - Show how to call the parent class method using super in the Dog class
=end

#* Solution:
class Animal

  def speak
    "I am an animal"
  end

end

class Dog < Animal
  def speak
    "Woof!"
  end
end

animal = Animal.new
dog = Dog.new

puts animal.speak.inspect
puts dog.speak.inspect



#* 4. Create a Class with a Static (Class) Method
puts "\n\n4. Create a Class with a Static (Class) Method: "

=begin
  Implement a MathOperations class with the following specifications:
  - Create a class method square that returns the square of a given number
  - Implement error handling for invalid input (e.g., non-numeric values)
  - Add additional class methods for other mathematical operations (e.g., cube, factorial)
  - Implement a method to perform multiple operations in sequence
  - Add documentation for each method explaining its purpose and usage
  - Create a method to generate a sequence of squares up to a given number
=end

#* Solution:
class MathOperations

  def self.squre(number)

  end

end

puts MathOperations.square(5) # => 25
puts MathOperations.square(-3) # => 9
puts MathOperations.square(0) # => 0



#* 5. Class with Private Methods
puts "\n\n5. Class with Private Methods: "

=begin
  Create a BankAccount class with these features:
  - Implement a private method calculate_interest that calculates interest based on balance and rate
  - Create a public method apply_interest that uses the private method to update the balance
  - Add methods for deposit and withdrawal with appropriate error checking
  - Implement a method to display account information (excluding sensitive data)
  - Use a private method to validate transactions (e.g., sufficient balance for withdrawals)
  - Add a method to transfer money between two BankAccount instances
=end

#* Solution:
class BankAccount

  # Attribute Reader:

  def initialize

  end

  def apply_interest

  end


  private

  def calculate_interest

  end

end

account = BankAccount.new(1000)
account.apply_interest(0.05)
puts account.balance # => 1050.0

account.apply_interest(0.10)
puts account.balance # => 1155.0



#* 6. Class with Constructor Overloading
puts "\n\n6. Class with Constructor Overloading: "

=begin
  Create a Rectangle class with the following specifications:
  - Implement two ways to initialize the class:
    1. With length and width as separate arguments
    2. With a single argument for a square (where length and width are equal)
  - Create a method area that returns the area of the rectangle
  - Implement a method perimeter that calculates the perimeter of the rectangle
  - Add error handling for invalid dimensions (e.g., negative or zero values)
  - Create a method to check if the rectangle is a square
  - Implement a to_s method that returns a string representation of the rectangle
=end

#* Solution:
class Rectangle

  # Attribute Reader:

  def initialize(length, width = nil)

  end

  def area

  end

end

rectangle = Rectangle.new(5, 10)
square = Rectangle.new(4)

puts rectangle.area
puts square.area



#* 7. Create an Interface with Modules
puts "\n\n7. Create an Interface with Modules: "

=begin
  Implement a module Drivable and use it in multiple classes:
  - Create a Drivable module that defines a method drive
  - Implement two classes, Car and Bike, which include the Drivable module
  - Override the drive method in each class to provide specific implementations
  - Add additional methods to the Drivable module (e.g., stop, turn)
  - Implement a method in the module that uses the drive method
  - Demonstrate how to use module_function for methods that don't need to be included in classes
=end

#* Solution:
module Drivable

end

class Car
  include Drivable

end

class Bike
  include Drivable

end

car = Car.new
bike = Bike.new

puts car.drive # => "Driving a car!"
puts bike.drive  # => "Riding a bike!"



#* 8. Class Inheritance with Super Keyword
puts "\n\n8. Class Inheritance with Super Keyword: "

=begin
  Create an employee hierarchy with these requirements:
  - Implement a base Employee class with a method info that prints name and position
  - Create a subclass Manager that inherits from Employee
  - Override the info method in Manager to include department information
  - Use the super keyword in Manager's info method to reuse the base class method
  - Add methods specific to Manager (e.g., assign_task, evaluate_performance)
  - Implement a method in Employee that can be extended in subclasses
=end

#* Solution:
class Employee

  def initialize(name, position)

  end

  def info

  end

end

class Manager < Employee
  def initialize(name, position, department)

  end

  def info

  end

end

employee = Employee.new("John", "Developer")
manager = Manager.new("Alice", "Manager", "IT")

puts employee.info # => "Name: John, Position: Developer"
puts manager.info # => "Name: Alice, Position: Manager, Department: IT"



#* 9. Create a Class with Read-Only Attribute
puts "\n\n9. Create a Class with Read-Only Attribute: "

=begin
  Implement a Book class with the following specifications:
  - Create attributes for title and author
  - Make the author attribute read-only (it cannot be modified after object creation)
  - Implement a method to display book information
  - Add a method to update the title while keeping author immutable
  - Implement custom comparison methods based on title or author
  - Create a class method to create a Book object from a string (e.g., "Title by Author")
=end

#* Solution:
class Book

  # Attribute Accessor and Attribute Reader:

  def initialize(title, author)

  end

end

book = Book.new("1984", "George Orwell")
puts book.title # => "1984"
puts book.author # => "George Orwell"

book.title = "Animal Farm"
puts book.title # => "Animal Farm"

# book.author = "Orwell" # => Error: undefined method `author=` (read-only)



#* 10. Overriding Operators
puts "\n\n10. Overriding Operators: "

=begin
  Create a Vector class with these features:
  - Implement attributes for x and y coordinates
  - Override the + operator to allow adding two Vector objects
  - Implement the - operator for subtracting vectors
  - Add methods for scalar multiplication and division
  - Implement comparison operators (==, <, >) based on vector magnitude
  - Create a method to calculate the dot product of two vectors
  - Implement a to_s method for string representation of the vector
=end

#* Solution:
class Vector

  # Attribute Reader:


  def initialize(x, y)

  end

  def +(other)

  end

  def to_s

  end

end

v1 = Vector.new(1, 2)
v2 = Vector.new(3, 4)
v3 = v1 + v2

puts v3.to_s # => "(4, 6)"



#* 11. Abstract Class with Inheritance
puts "\n\n11. Abstract Class with Inheritance: "

=begin
  Create a shape hierarchy to demonstrate abstraction and inheritance:
  - Implement an abstract Shape class with a method area that raises NotImplementedError
  - Create Circle and Rectangle subclasses that inherit from Shape
  - Override the area method in each subclass with the correct area calculation
  - Implement a method in Shape to compare areas of two shapes
  - Add a perimeter method to Shape and implement it in subclasses
  - Create a method in Shape to return a string description of the shape
=end

#* Solution:
class Shape

  def area

  end

end

class Circle < Shape

  def initialize(radius)

  end

  def area

  end

end

class Rectangle < Shape

  def initialize(length, width)

  end

  def area

  end

end

circle = Circle.new(5)
rectangle = Rectangle.new(4, 6)

puts circle.area  # => 78.(something)
puts rectangle.area # => 24




#* 12. Class with Class Variables and Methods
puts "\n\n12. Class with Class Variables and Methods: "

=begin
  Implement an Employee class with these specifications:
  - Use a class variable to keep track of all employees created
  - Implement a class method total_employees to return the number of employees
  - Create an instance method info to display employee details
  - Add a class method to find an employee by their ID
  - Implement a method to calculate the average salary of all employees
  - Create a class method to generate a report of all employees
=end

#* Solution:
class Employee

  # Instance Variable: @@total_employees = 0

  def initialize(name, position)

  end

  def self.total_employees

  end

  def info

  end

end

employee1 = Employee.new("John", "Developer")
employee2 = Employee.new("Jane", "Designer")

puts Employee.total_employees # => 2
puts employee1.info           # => "Name: John, Position: Developer"
puts employee2.info           # => "Name: Jane, Position: Designer"



#* 13. Create a Singleton Class
puts "\n\n13. Create a Singleton Class: "

=begin
  Implement a Logger class as a singleton with these features:
  - Ensure only one instance of the class can be created
  - Implement a method log to simulate logging a message
  - Add methods for different log levels (e.g., info, warning, error)
  - Create a method to set the output destination (e.g., console, file)
  - Implement a method to retrieve all logged messages
  - Add a feature to clear the log or rotate log files
=end

#* Solution:
class Logger

  # Instance Variable: @@instance = nil

  def self.instance

  end

  def log(message)

  end

  private_class_method :new

end

logger1 = Logger.instance
logger2 = Logger.instance

logger1.log("This is the first log.") # => "Log: This is the first log."
logger2.log("This is the second log.") # => "Log: This is the second log."

puts logger1 == logger2



#* 14. Encapsulation with Protected Methods
puts "\n\n14. Encapsulation with Protected Methods: "

=begin
  Create a Person class with the following specifications:
  - Implement an attribute for name
  - Add a protected method compare_name that compares names of two Person objects
  - Create a public method same_name? that uses the protected method
  - Implement a method to safely update the name with validation
  - Add a protected method to generate a unique identifier for each person
  - Create a public method that uses the protected methods to compare two people
=end

#* Solution:
class Person

  # Attribute Reader:

  def initialize(name)

  end

  def same_name?(other)

  end

  protected

  def compare_name(other)

  end

end

person1 = Person.new("Alice")
person2 = Person.new("Alice")
person3 = Person.new("Bob")



#* 15. Polymorphism with Duck Typing
puts "\n\n15. Polymorphism with Duck Typing: "

=begin
  Demonstrate polymorphism using duck typing:
  - Create two classes, Dog and Cat, both with a speak method
  - Implement the speak method to print "Woof!" for Dog and "Meow!" for Cat
  - Create a method make_animal_speak that accepts any object and calls its speak method
  - Add more methods to Dog and Cat (e.g., eat, sleep) to show further polymorphic behavior
  - Implement a third class (e.g., Bird) to demonstrate extensibility
  - Create a method that works with any animal-like object with multiple behaviors
=end

#* Solution:
class Dog

  def speak

  end

end

class Cat

  def speak

  end

end

def make_animal_speak(animal)


end

dog = Dog.new
cat = Cat.new

make_animal_speak(dog) # => "Woof!"
make_animal_speak(cat) # => "Meow!"
