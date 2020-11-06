require 'pg'
require_relative 'peep'
require_relative 'database_connection'
require 'date'

class ChitterBoard

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps;")
    result.map do |peep|
      Peep.new(peep['id'], peep['message'], peep['user_id'], peep['date'], peep['likes'])
    end
  end

  def self.add(message:, user_id:)
    date = DateTime.now.to_s[0..9]
    DatabaseConnection.query("INSERT INTO peeps (message, user_id, date, likes) VALUES ('#{message}', '#{user_id}', '#{date}', 0);")
    true
  end

  def self.delete(id:)
    DatabaseConnection.query("DELETE FROM peeps WHERE id = '#{id}';")
    true
  end

  def self.like_peep(id:)
    DatabaseConnection.query("UPDATE peeps SET likes = likes + 1 WHERE id = '#{id}';")
  end

  def self.search(keyword:)
    result = DatabaseConnection.query("SELECT * FROM peeps WHERE message LIKE '%#{keyword}%';")
    result.map do |peep|
      Peep.new(peep['id'], peep['message'], peep['user_id'], peep['date'], peep['likes'])
    end
  end

end