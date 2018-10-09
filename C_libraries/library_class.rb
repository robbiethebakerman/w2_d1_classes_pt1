# Model a Library as a class.
#
# Create a class for a Library that has an array of books. Each book should be a hash with a title, which is a string, and rental details, which is another hash with a student name and due date.
# This should look something like:
#
#   {
#     title: "lord_of_the_rings",
#     rental_details: {
#      student_name: "Jeff",
#      date: "01/12/16"
#     }
#   }
# Create a getter for the books
# Create a method that takes in a book title and returns all of the information about that book.
# Create a method that takes in a book title and returns only the rental details for that book.
# Create a method that takes in a book title and adds it to our book list (add a new hash for the book with the student name and date being left as empty strings)
# Create a method that changes the rental details of a book by taking in the title of the book, the student renting it and the date it's due to be returned.

# If time, refactor to initialize new Library instances with an empty book array (no arguments needed), then add books - probably more realistic example for later on

class Library

  def initialize(books)
    @books = books
  end

  def get_books
    return @books
  end

  def get_book_info(title)
    for book in @books
      return book if book[:title] == title
    end
    return nil
  end

  def get_book_rental_details(title)
    for book in @books
      return book[:rental_details] if book[:title] == title
    end
    return nil
  end

#################

# REFACTORED

  def get_rental_details(title)
    found_book = get_book_info(title)
    return found_book[:rental_details]
  end

##################

  def add_book(title)
    new_book = {
      title: title,
      rental_details: {
        student_name: '',
        date: ''
      }
    }
    @books.push(new_book)
  end

  def update_rental_details(title, student_name, date)
    for book in @books
      if book[:title] == title
        updated_details = book[:rental_details]
        updated_details[:student_name] = student_name
        updated_details[:date] = date
      end
    end
  end

  def update_rental(title, student, date)
    book_to_update = get_book_info(title)
    book_to_update[:rental_details][:student_name] = student
    book_to_update[:rental_details][:date] = date
    return book_to_update[:rental_details]
  end

end
