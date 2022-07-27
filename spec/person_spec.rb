require_relative './../person'

describe 'Person Tests' do
  context 'Create Object' do
    it 'Person has the correct Info' do
    name='Elio Cortes'
    age= 45
    person=Person.new(age, name)
    expect(person.name).to eq(name)
    expect(person.age).to eq(age)
    end
  end
end
