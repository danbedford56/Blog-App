require 'chitter_board'

RSpec.describe ChitterBoard do
  
  describe '.all' do
    it 'Returns all peeps' do
      ChitterBoard.add(message: "Hello", user_id: '1')
      ChitterBoard.add(message: "Hi", user_id: '1')
      peeps = ChitterBoard.all
      expect(peeps.first.message).to include "Hello"
      expect(peeps[1].message).to include "Hi"
    end
  end

  describe '.add' do
    it 'Adds a new peep to the db' do
      expect(ChitterBoard.add(message: "Hello", user_id: '1')).to eq true
    end
  end

  describe '.delete' do
    it 'Deletes a peep from the db' do
      ChitterBoard.add(message: "Hello", user_id: '1')
      expect(ChitterBoard.delete(id: '1')).to eq true
    end
  end

  describe '.like_peep' do
    it 'Likes a peep with given id' do
      ChitterBoard.add(message: "Hello", user_id: '1')
      expect(DatabaseConnection).to receive(:query).with "UPDATE peeps SET likes = likes + 1 WHERE id = '#{1}';"
      ChitterBoard.like_peep(id: 1)
    end
  end

end