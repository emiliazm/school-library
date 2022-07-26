require_relative 'book'
require_relative 'student'
require_relative 'teacher'
require_relative 'rental'
require 'json'

module DataStorage
  def read_books
    file = 'books.json'
    data = []
    if File.exist?(file) && File.read(file) != ''
      JSON.parse(File.read(file)).each do |element|
        data.push(Book.new(element['title'], element['author'], id: element['id'].to_i))
      end
    end
    data
  end

  def save_books(books)
    data = []
    books.each do |book|
      data.push({ id: book.id, title: book.title, author: book.author })
    end
    File.write('books.json', JSON.generate(data))
  end

  def read_people
    file = 'people.json'
    data = []
    if File.exist?(file) && File.read(file) != ''
      JSON.parse(File.read(file)).each do |element|
        if element['data_type'] == 'Teacher'
          data.push(Teacher.new(element['age'].to_i, element['specialization'], element['name'],
                                id: element['id'].to_i))
        else
          data.push(Student.new(element['age'].to_i, element['classroom'], element['name'],
                                parent_permission: element['parent_permission'], id: element['id'].to_i))
        end
      end
    end
    data
  end

  def save_people(people)
    data = []
    people.each do |person|
      if person.instance_of?(Teacher)
        data.push({ id: person.id, age: person.age, name: person.name, specialization: person.specialization,
                    data_type: person.class })
      else
        data.push({ id: person.id, age: person.age, classroom: nil, name: person.name, parent_permission: person.parent_permission,
                    data_type: person.class })
      end
      File.write('people.json', JSON.generate(data))
    end
  end

  def read_rentals(books, people)
    file = 'rentals.json'
    data = []
    if File.exist?(file) && File.read(file) != ''
      JSON.parse(File.read(file)).each do |element|
        book = books.select { |b| b.id == element['book_id'] }
        person = people.select { |p| p.id == element['person_id'] }
        data.push(Rental.new(element['date'], person[0], book[0]))
      end
    end
    data
  end

  def save_rentals(rentals)
    data = []
    rentals.each do |rental|
      data.push({ date: rental.date, person_id: rental.person.id, book_id: rental.book.id })
    end
    File.write('rentals.json', JSON.generate(data))
  end
end
