require_relative './../rental'
require_relative './../person'
require_relative './../book'

describe Rental do
  context 'When creating a new rental' do
    book = Book.new('Game of Thrones', 'George')

    person = Person.new(55, 'Emilia', parent_permission: true)

    rental = Rental.new('2020-01-01', person, book)
    rental_date = rental.date

    rental_book_title = rental.book.title
    rental_person_name = rental.person.name

    it 'Date should be "2020-01-01"' do
      expect(rental_date).to eql('2020-01-01')
    end

    it 'Name should be "Emilia"' do
      expect(rental_person_name).to eql('Emilia')
    end

    it 'Title should be "Game of Thrones"' do
      expect(rental_book_title).to eql('Game of Thrones')
    end
  end
end
