require 'pg'

def clear_test_db
  connection = PG.connect(dbname: 'message_board_test')
  connection.exec("TRUNCATE messages;")
end