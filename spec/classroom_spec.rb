require_relative '../classroom'
require_relative '../student'

describe Classroom do
  context "When creating a new classroom" do
    classroom = Classroom.new('Math')

    classroom_label = classroom.classroom_label

    it 'Classroom labe should be "Math"' do
      expect(classroom_label).to eql('Math')
    end
  end

  context "When adding students to a clasroom" do
    classroom = Classroom.new('Math')
    student = Student.new(12, 'Math', 'Emilia', parent_permission: true, id: 1)

    classroom_label = classroom.classroom_label
    student_name = classroom.student.name
    student_in_classrrom = student.clasroom

    it 'A new student should be added' do
      expect(classroom_name).to eql('Emilia')
    end

    it 'Student should belong to "Math" classroom' do
      expect(student_in_classrrom).to eql(clasroom)
    end
  end

end

    