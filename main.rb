require './person'
require './student'
require './classroom'
require './rental'
require './book'

student_1 = Student.new('Math', 18, 'Student 1')
student_2 = Student.new('Math', 16, 'Student 2')

book_1 = Book.new('Book 1', 'Author 1')
book_2 = Book.new('Book 2', 'Author 2')

rental_1 = Rental.new('2021-10-05', student_1, book_1)
rental_2 = Rental.new('2021-10-06', student_1, book_2)
p student_1.rentals.length

math_classroom = Classroom.new('Math')
math_classroom.add_student(student_1)
math_classroom.add_student(student_2)
p math_classroom.students.first.name
p math_classroom.students.last.name
