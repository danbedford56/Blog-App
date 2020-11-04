require 'pg'
require_relative 'message'
require_relative 'database_connection'

class Message_Board

  def self.all
    result = DatabaseConnection.query("SELECT * FROM messages;")
    result.map do |message|
      Message.new(message['id'], message['message'])
    end
  end

  def self.add(message)
    DatabaseConnection.query("INSERT INTO messages (message) VALUES ('#{message}');")
    true
  end

  def self.delete(id:)
    DatabaseConnection.query("DELETE FROM messages WHERE id = '#{id}';")
    true
  end

end