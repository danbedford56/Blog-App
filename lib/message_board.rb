require 'pg'
require_relative 'message'

class Message_Board

  def self.all
    connection = self.connect
    result = connection.exec("SELECT * FROM messages;")
    result.map do |message|
      Message.new(message['id'], message['message'])
    end
  end

  def self.add(message)
    connection = self.connect
    connection.exec("INSERT INTO messages (message) VALUES ('#{message}');")
    true
  end

  def self.delete(message)
    connection = self.connect
    connection.exec("DELETE FROM messages WHERE message = '#{message}';")
    true
  end

  private
  def self.connect
    if ENV['ENVIRONMENT'] == 'test'
      return PG.connect(dbname: 'message_board_test')
    else
      return PG.connect(dbname: 'message_board')
    end
  end
end