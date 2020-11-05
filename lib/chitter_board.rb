require 'pg'
require_relative 'peep'
require_relative 'database_connection'

class ChitterBoard

  def self.all
    result = DatabaseConnection.query("SELECT * FROM messages;")
    result.map do |message|
      Peep.new(message['id'], message['message'])
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