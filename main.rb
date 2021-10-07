require './person'
require './student'
require './classroom'
require './rental'
require './book'

student1 = Student.new('Math', 18, 'Student 1')
student2 = Student.new('Math', 16, 'Student 2')

book1 = Book.new('Book 1', 'Author 1')

book1.add_rental('2021-10-07', student1)
p student1.rentals.length
p book1.rentals

math_classroom = Classroom.new('Math')
math_classroom.add_student(student1)
math_classroom.add_student(student2)
p math_classroom.students.first.name
p math_classroom.students.last.name
