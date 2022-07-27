require_relative './../book'

describe 'Book' do
  context 'Create' do
    it 'Book has the correct Info' do
      title = 'potter'
      author = 'saif'
      book = Book.new(title, author)
      book_title = book.title
      book_author = book.author
      expect(book_title).to eq(title)
      expect(book_author).to eq(author)
    end
  end
end
