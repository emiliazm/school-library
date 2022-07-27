require_relative './../classroom'
require_relative './../student'

describe Classroom do
  context 'When creating a new classroom' do
    classroom = Classroom.new('Math')

    classroom_label = classroom.label

    it 'Classroom labe should be "Math"' do
      expect(classroom_label).to eql('Math')
    end
  end

  context 'When adding students to a classroom' do
    classroom = Classroom.new('Math')
    students = [
      Student.new(12, 'Math', 'Emilia', parent_permission: true, id: 1)
    ]

    classroom.add_student(students[0])

    student_name = classroom.students[0].name

    it 'A new student should be added' do
      expect(student_name).to eql('Emilia')
    end

    student_in_classroom = students[0].classroom

    it 'Student should belong to "Math" classroom' do
      expect(student_in_classroom).to eql(classroom)
    end
  end
end
