require_relative 'library'

describe Calendar do
	before do
		@calendar = Calendar.instance
	end

	it 'should have a date of 0' do
		@calendar.get_date == 0
	end

	it 'should have a date of 1' do
		date_advance = 0
		@calendar.advance == date_advance + 1
	end
end

describe Book do
	before do
		@book = Book.new(1, "50 shades darker", "E. L. James")
	end

	it 'should print the book title' do
		book_title = "50 shades darker"

		@book.title.should == book_title
	end

	it 'should get the book id' do
		book_id = 1

		@book.id.should == book_id
	end

	it 'should get the book author' do
		#book_author = "E. L. James"

		@book.author.should == "E. L. James"
	end

	it 'should be nil' do
		@book.get_due_date.should == nil
	end
	it 'return the due date of the book' do

		@book.check_out(8).should == 8
	end
	it 'should be nil' do

		@book.check_in.should == nil
	end

	it 'has a string representation' do
		book_string = "1: 50 shades darker by E. L. James"
		@book.to_s.should == book_string
	end
end

describe Member do
	before do
		member = Member.new("Josh", lib)
	end
	it 'returns the member name'
	it 'adds a book to the list'
	it 'removes the book from the list'
	it '3 books'
	it 'should return the book list'
	it ''
end
=begin
	
end
context "created with a default id"
before do
	@book = Book.new("50 shades darker", "E. L. James")
end
=end