require_relative 'database_connection'

class User
  attr_reader :id, :username
  
  def initialize(id, username)
    @id = id
    @username = username
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM users;")
    result.map do |user|
      User.new(user['id'], user['username'])
    end
  end

  def self.check_username_taken(username:)
    result = self.all
    result.each do |user|
      return false if user.username == username
    end
    true
  end

  def self.create_user(username:, password:)
    DatabaseConnection.query("INSERT INTO users (username, password) VALUES ('#{username}', '#{password}');")
  end

  def self.check_login(username:, password:)
    result = DatabaseConnection.query("SELECT password FROM users WHERE username LIKE '#{username}';")
    if result[0]['password'] == password
      true
    else
      false
    end
  end

end