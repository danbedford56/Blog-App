require 'pg'
require 'uri'

class DatabaseConnection
  @database

  def self.setup(dbname)
    uri = URI.parse(ENV['DATABASE_URL'])
    @database = PG.connect({
      host: uri.host,
      dbname: uri.path[1..-1],
      user: uri.user,
      password: uri.password
    })
  end

  def self.query(query)
    @database.exec(query)
  end

  def self.database
    return @database
  end

end