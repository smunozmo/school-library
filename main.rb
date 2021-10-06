require './person'
require './student'
require './classroom'
require './rental'
require './book'

student1 = Student.new('Math', 18, 'Student 1')
student2 = Student.new('Math', 16, 'Student 2')

book1 = Book.new('Book 1', 'Author 1')
book2 = Book.new('Book 2', 'Author 2')

rental1 = Rental.new('2021-10-05', student1, book1)
rental2 = Rental.new('2021-10-06', student1, book2)
p rental1.date
p rental2.date
p student1.rentals.length

math_classroom = Classroom.new('Math')
math_classroom.add_student(student1)
math_classroom.add_student(student2)
p math_classroom.students.first.name
p math_classroom.students.last.name
