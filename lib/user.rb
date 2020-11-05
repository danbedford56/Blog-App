require_relative 'database_connection'

class User
  attr_reader :id, :username
  @current_user

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

  def self.create_user(username:, password:)
    return false if !self.check_username_taken(username: username)
    DatabaseConnection.query("INSERT INTO users (username, password) VALUES ('#{username}', '#{password}');")
    result = DatabaseConnection.query("SELECT id FROM users WHERE username LIKE '#{username}';")
    @current_user = result[0]['id']
  end

  def self.check_login(username:, password:)
    users = DatabaseConnection.query("SELECT username FROM users;")
    ## ToDo: Think there must be a more efficient way of doing this ##
    exists = false
    users.each do |user|
      exists = true if user['username'] == username
    end
    ##
    return false if !exists
    result = DatabaseConnection.query("SELECT * FROM users WHERE username LIKE '#{username}';")
    if result[0]['password'] == password
      @current_user = result[0]['id']
      true
    else
      false
    end
  end

  def self.find_user(id:)
    result = DatabaseConnection.query("SELECT * FROM users WHERE id = #{id.to_s};")
    User.new(result[0]['id'], result[0]['username'])
  end

  def self.current_user
    @current_user
  end

  private
  def self.check_username_taken(username:)
    result = self.all
    result.each do |user|
      return false if user.username == username
    end
    true
  end

end