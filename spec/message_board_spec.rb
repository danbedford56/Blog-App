require 'message_board'

RSpec.describe Message_Board do
  
  describe '.all' do
    it 'Returns all messages' do
      Message_Board.add("Hello")
      Message_Board.add("Hi")
      messages = Message_Board.all
      expect(messages.first.message).to include "Hello"
      expect(messages[1].message).to include "Hi"
    end
  end

  describe '.add' do
    it 'Adds a new message to the db' do
      expect(Message_Board.add("Hello")).to eq true
    end
  end

  describe '.delete' do
    it 'Deletes a message from the db' do
      Message_Board.add("Hello")
      expect(Message_Board.delete(id: "1")).to eq true
    end
  end
end