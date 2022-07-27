require_relative '../teacher'

describe Teacher do
  context "When texting the Teacher class" do
    teacher = Teacher.new(55, 'Math', 'Jhon', parent_permission: false, id: 1 )
    
    teacher_specialization = teacher.specialization
    teacher_age = teacher.age
    teacher_name = teacher.name
    can_use_services = teacher.can_use_services

    it "Create new teacher with given parameter" do
      expect(teacher_age).to eql(55)
      expect(teacher_specialization).to eql('Math')
      expect(teacher_name).to eql('John')
      expect(can_use_services).to eql(true)
    end
  end
end
