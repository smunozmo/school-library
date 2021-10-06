require './person'
require './student'
require './classroom'

student = Student.new('A1', 18)
person = Person.new(16)

classroom = Classroom.new('A1')

classroom.add_student(student)
classroom.add_student(person)

p classroom.students.last.classroom.label
p person.classroom.label
person.classroom.label = 'A2'

p person.classroom.label
p classroom.students.last.classroom.label
