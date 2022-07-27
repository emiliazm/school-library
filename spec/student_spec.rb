require_relative './../student'

describe 'Student Tests' do
  context 'Create Object' do
    it 'Student has the correct Info' do
    name='Elio Cortes'
    age= 45
    classroom = 'math'
    parent_permission = true
    student=Student.new(age, classroom, name, parent_permission: true )
    expect(student.age).to eq(age)
    expect(student.classroom).to eq(classroom)
    expect(student.name).to eq(name)
    expect(student.parent_permission).to eq(true)
    end
  end
end
