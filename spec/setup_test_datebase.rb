require 'pg'

p "Setting up test database..."

connection = PG.connect(dbname: 'chitter_2_test')

connection.exec("TRUNCATE chitter_messages;")