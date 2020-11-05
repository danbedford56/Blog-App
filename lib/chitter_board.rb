require 'pg'
require_relative 'peep'
require_relative 'database_connection'

class ChitterBoard

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps;")
    result.map do |peep|
      Peep.new(peep['id'], peep['message'], peep['user_id'])
    end
  end

  def self.add(message:, user_id:)
    DatabaseConnection.query("INSERT INTO peeps (message, user_id) VALUES ('#{message}', '#{user_id}');")
    true
  end

  def self.delete(id:)
    DatabaseConnection.query("DELETE FROM peeps WHERE id = '#{id}';")
    true
  end

end