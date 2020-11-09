require 'pg'
require 'uri'

class DatabaseConnection
  @database

  def self.setup(dbname)
    if ENV['ENVIRONMENT'] = 'test'
      @database = PG.connect(dbname: 'chitter_test')
    else
      @database = PG.connect(dbname: 'chitter')
    end
  end

  def self.query(query)
    @database.exec(query)
  end

  def self.database
    return @database
  end

end