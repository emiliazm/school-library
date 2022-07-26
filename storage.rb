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
        data.push(Book.new(element['title'], element['author']))
      end
    end
    data
  end

  def save_books(books)
    data = []
    books.each do |book|
      data.push({ title: book.title, author: book.author })
    end
    File.write('books.json', JSON.generate(data))
  end

  def read_people
    file = 'people.json'
    data = []
    if File.exist?(file) && File.read(file) != ''
      JSON.parse(File.read(file)).each do |element|
        if element == "Teacher"
         data.push(Teacher.new(element['age'], element['name'], element['specialization']))
         
        else 
         data.push(Student.new(element['age'], element['name'], element['parent_permission']))
        end
      end
    end
    data
  end

  def save_people(people)
    data = []
    people.each do |person|
      if type == 'Teacher'
        data.push({age: person.age, name: person.name, parent_permission: person.parent_permission })
      else
        data.push({age: person.age, name: person.name, specialization: person.specialization })
      end
      File.write('people.json', JSON.generate(data))
    end
  end
end
