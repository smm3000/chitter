require 'pg'

class Post 
    def self.all 
        if ENV['RACK_ENV'] == 'test'
            connection = PG.connect(dbname: 'chitter_2_test')
        else 
            connection = PG.connect(dbname: 'chitter_2')
        end 

        result = connection.exec("SELECT * FROM chitter_messages;")
        result.map { |peep| peep['message'] }
    end 
end 