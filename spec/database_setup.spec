require 'database_connection'

describe DatabaseConnection do
  
  describe '.setup' do
    it 'Sets up the correct database' do
      expect(PG).to receive(:connect).with('chitter_test')
      DatabaseConnection.setup('chitter_test')
    end
  end

  describe '.query' do
    it 'Makes and sql query provided on correct database' do
      expect(PG).to receive(:exec).with('SELECT * FROM users')
      DatabaseConnection.query('SELECT * FROM users')
    end
  end
end