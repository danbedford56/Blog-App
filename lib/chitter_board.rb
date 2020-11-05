require 'pg'
require_relative 'peep'
require_relative 'database_connection'
require 'date'

class ChitterBoard

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps;")
    result.map do |peep|
      Peep.new(peep['id'], peep['message'], peep['user_id'], peep['date'])
    end
  end

  def self.add(message:, user_id:)
    date = DateTime.now.to_s[0..9]
    DatabaseConnection.query("INSERT INTO peeps (message, user_id, date) VALUES ('#{message}', '#{user_id}', '#{date}');")
    true
  end

  def self.delete(id:)
    DatabaseConnection.query("DELETE FROM peeps WHERE id = '#{id}';")
    true
  end

end