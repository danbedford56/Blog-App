require_relative 'database_connection'

if ENV['ENVIRONMENT'] == 'test'
  DatabaseConnection.setup('message_board_test')
else
  DatabaseConnection.setup('message_board')
end