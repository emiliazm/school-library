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
end
