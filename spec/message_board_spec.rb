require 'chitter_board'

RSpec.describe ChitterBoard do
  
  describe '.all' do
    it 'Returns all peeps' do
      ChitterBoard.add("Hello")
      ChitterBoard.add("Hi")
      peeps = ChitterBoard.all
      expect(peeps.first.message).to include "Hello"
      expect(peeps[1].message).to include "Hi"
    end
  end

  describe '.add' do
    it 'Adds a new peep to the db' do
      expect(ChitterBoard.add("Hello")).to eq true
    end
  end

  describe '.delete' do
    it 'Deletes a peep from the db' do
      ChitterBoard.add("Hello")
      expect(ChitterBoard.delete(id: "1")).to eq true
    end
  end
end