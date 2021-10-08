require './student'
require './teacher'
require './book'
require './rental'

$books = []
$people = []

puts 'Welcome to School Library App!'

def choose_option
  puts
  puts 'Please choose an option by enterin a number:'
  puts '1 - List all books'
  puts '2 - List all people'
  puts '3 - Create a person'
  puts '4 - Create a book'
  puts '5 - Create a rental'
  puts '6 - List all rentals for a given person id'
  puts '7 - Exit'
  puts

  print 'Option: '
  gets.chomp
end

def list_books
  unless $books.length == 0
    $books.each do |e|
      puts "Title: \"#{e.title}\", Author: #{e.author}"
    end
  else
    puts 'There are no books created!'
  end
end

def list_people
  unless $people.length == 0
    $people.each do |e|
      puts "[#{e.class.to_s}] Name: #{e.name}, ID: #{e.id}, Age: #{e.age}"
    end
  else
    puts 'There are no people created!'
  end
end

def create_person
  print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
  person_type = gets.chomp
  print 'Age: '
  person_age = gets.chomp.to_i
  print 'Name: '
  person_name = gets.chomp

  if person_type == '1'
    print 'Has parent permission? [Y/N]: '
    has_permission = gets.chomp
    if has_permission == 'y' || has_permission == 'Y'
      has_perm_bool = true
    elsif has_permission == 'n' || has_permission == 'N'
      has_perm_bool = false
    end

    $people.push(Student.new(person_age, person_name, has_perm_bool))
    puts 'Person created successfully'
  elsif person_type == '2'
    print 'Specialization: '
    specialization = gets.chomp
    $people.push(Teacher.new(specialization, person_age, person_name))
    puts 'Person created successfully'
  else
    puts 'Please, select a correct person type'
  end
end

def create_book
  print 'Title: '
  book_title = gets.chomp
  print 'Author: '
  book_author = gets.chomp
  $books.push(Book.new(book_title, book_author))
  puts 'Book created successfully'
end

def create_rental
  unless $books.length == 0 || $people.length == 0
    puts 'Select a book from the following list by number'
    $books.each_with_index do |e, idx|
      puts "#{idx}) Title: \"#{e.title}\", Author: #{e.author}"
    end
    book_number = gets.chomp.to_i
    puts

    puts 'Select a person from the following list by number (not id)'
    $people.each_with_index do |e, idx|
      puts "#{idx}) [#{e.class.to_s}] Name: #{e.name}, ID: #{e.id}, Age: #{e.age}"
    end
    person_number = gets.chomp.to_i

    puts
    print 'Date: '
    rental_date = gets.chomp
    Rental.new(rental_date, $people[person_number], $books[book_number])
    puts 'Rental created successfully'
  else
    puts 'There are no books and/or people created!'
  end
end

def list_rentals_by_id
  print 'ID of person: '
  person_id = gets.chomp.to_i

  person_found = false
  person_selected = nil
  $people.each do |e|
    if e.id == person_id
      person_found = true
      person_selected = e
    end
  end

  unless person_found == false
    unless person_selected.rentals.length == 0
      person_selected.rentals.each do |e|
        puts "Date: #{e.date}, Book \"#{e.book.title}\" by #{e.book.author}"
      end
    else
      puts 'This person does not have rentals'
    end
  else
    puts 'ID does not exist!'
  end
end

def main
  exit_program = false
  loop do
    chosen_option = choose_option
    case chosen_option
    when '1'
      list_books
    when '2'
      list_people
    when '3'
      create_person
    when '4'
      create_book
    when '5'
      create_rental
    when '6'
      list_rentals_by_id
    when '7'
      exit_program = true
    else
      puts 'That\'s not a correct option'
    end
    break if exit_program
  end
end

main
