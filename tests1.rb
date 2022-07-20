require_relative 'book'
require_relative 'person'
require_relative 'rental'

person = Person.new(22, 'maximilianus')

book1 = Book.new('title1', 'author1')
book2 = Book.new('title2', 'author2')

Rental.new('2022-01-01', person, book1)
Rental.new('2022-02-02', person, book2)

puts person.rentals
puts book1.rentals
puts book2.rentals
