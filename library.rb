#File: library.rb

require 'singleton'

class Calendar

	include Singleton

	attr_accessor :date

	def initialize(date = 0)
		@date = date
		#puts "date has been inialized"
	end

	def get_date
		puts @date
	end

	def advance
		puts @date += 1
	end
end
	
	
class Book
	attr_accessor :id, :title, :author, :due_date 
	def initialize(id, title, author)
		@id = id
		@title = title
		@author = author
	end

	def get_id
		puts @id
	end

	def get_title
		puts @title.capitalize
	end

	def get_author
		puts @author.capitalize
	end

	def get_due_date
		puts @due_date
	end

	def check_out(due_date)
		@due_date = due_date 
	end

	def check_in
		@due_date = nil
	end

	def to_s
		puts "#{id}: #{title} by #{author}"
		#puts id.to_s + ': ' + title.to_s + ' by ' + author.to_s
	end
end

class Member
	attr_accessor :name, :library
	def initialize(name, library)
		@name = name
		@library = Library.instance
	end

	def get_name
		puts @name.capitalize
	end

	def check_out(book)
		book_list = [] #make book an array
		if book_list.length < 3 
			book_list.push(book)		#add a book to the list
		else
			puts "Member has 3 books checked out already" # if list is full
		end
	end

	def return(book)
		book_list.pop(book)
		if book_list.length < 1
			puts @name.to_s + " has no more books to return!"
		end
	end

	def get_books()
		puts book_list.sort
	end

	def send_overdue_notice(notice)
		puts @name.to_s + "," + notice.to_s
	end
end

class Library
	include Singleton

	def initialize()
		lib = Library.instance
		File.open('collection.txt', 'r') do |file|
			collection = []
 			i = 1
 			id = i
				while line = file.gets
					title, author = line.split(',')
					collection << id.to_s + ': ' + title + author << Book.new(id, title, author)
					id = id + 1
				end
				puts collection
 			end

 		@flag = false
 		#@flag << lib

		calendar1 = Calendar.instance
		memberDictionary = {:name => @name}
		member_served = nil
	end

	def open()
		raise "The Library is already open!" unless @flag
		calendar1.advance
		@flag = true
		puts "Today is day " +  calendar1.get_date
	end

	def find_all_overdue_books()
		raise "The Library is already open!" unless @flag

		#currDate = calendar1.get_date
		overdue = []
		while memberDictionary.foreach(@name)
			@name.get_books
			if @book.get_due_date < 1
				puts "Members with books overdue:"
				puts "#{@name}, books: #{@book}"
			else
				puts "#{name}, No books overdue"
			end
		end
	end

	def issue_card(name_of_member)
		raise "The Library is already open!" unless @flag

		if name_of_member.issue_card == true
			puts name_of_member.to_s + " already has a library card."
		else
			puts Member.new(name_of_member)
			puts "Library card issued to #{name_of_member}"
		end
	end

	def serve(name_of_member)
		raise "The Library is already open!" unless @flag

			if member_served !nil
				puts member_served = nil
				memberDictionary.find(name_of_member)
				puts "Now serving #{name_of_member}"
			else
			end
	end

	def find_all_overdue_books
	end

	def check_in(book_numbers)
	end

	def search(string)
		if string.length < 3
			raise "please enter 3 letters or more in your search"
		else
		end
	end

	def check_out(*book_ids)
	end

	def close()
		raise "The Library is already open!" unless @flag
		puts "Good Night"
	end

	def quit()
		puts "The library is now closed for renovations"
	end
end
end