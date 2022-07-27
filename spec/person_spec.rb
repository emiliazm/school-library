require_relative './../person'

describe 'Person Tests' do
  context 'Create Object' do
    it 'Person has the correct Info' do
    name='Elio Cortes'
    age= 45
    parent_permission = true
    person=Person.new(age, name, parent_permission: true)
    expect(person.name).to eq(name)
    expect(person.age).to eq(age)
    expect(person.parent_permission).to eq(true)
    end
  end
end
