require('minitest/autorun')
require('minitest/rg')
require_relative('../library_class')

class TestLibrary < MiniTest::Test

  def setup

    @books1 = [
      {
        title: "lord_of_the_rings",
        rental_details: {
          student_name: "Jeff",
          date: "01/12/16"
        }
      },
      {
        title: "catch_22",
        rental_details: {
          student_name: "Tom",
          date: "05/10/20"
        }
      }
    ]

    @library1 = Library.new(@books1)

  end

  def test_get_books
    assert_equal(@books1, @library1.get_books)
  end

  def test_get_book_info__book_found
    assert_equal(@books1[1], @library1.get_book_info('catch_22'))
  end

  def test_get_book_info__book_not_found
    assert_nil(@library1.get_book_info('bridget_jones'))
  end

  def test_get_book_rental_details__book_found
    assert_equal(@books1[0][:rental_details], @library1.get_book_rental_details('lord_of_the_rings'))
  end

  def test_get_rental_details__book_found
    assert_equal(@books1[0][:rental_details], @library1.get_rental_details('lord_of_the_rings'))
  end

  def test_get_book_rental_details__book_not_found
    assert_nil(@library1.get_book_rental_details('bridget_jones'))
  end

  def test_add_book
    @library1.add_book('bridget_jones')
    books = @library1.get_books
    assert_equal('bridget_jones', books[2][:title])
  end

  def test_update_rental_details
    @library1.update_rental_details('catch_22', 'Robbie', '12/12/18')
    assert_equal('Robbie', @library1.get_books[1][:rental_details][:student_name])
    assert_equal('12/12/18', @library1.get_books[1][:rental_details][:date])
  end

  def test_update_rental
    @library1.update_rental_details('catch_22', 'Robbie', '12/12/18')
    assert_equal('Robbie', @library1.get_books[1][:rental_details][:student_name])
    assert_equal('12/12/18', @library1.get_books[1][:rental_details][:date])
  end

  def test_update_rental__return
    new_details = {
      student_name: 'Robbie',
      date: '12/12/18'
    }
    result = @library1.update_rental('catch_22', 'Robbie', '12/12/18')
    assert_equal(result, new_details)
  end

end
