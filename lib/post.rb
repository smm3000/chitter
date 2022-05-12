require 'pg'

class Post 

    attr_reader :id, :message

    def initialize(id:, message:)
        @id = id
        @message = message
    end 

    def self.all 
        if ENV['RACK_ENV'] == 'test'
            connection = PG.connect(dbname: 'chitter_2_test')
        else 
            connection = PG.connect(dbname: 'chitter_2')
        end 
        result = connection.exec("SELECT * FROM chitter_messages;")
        result.map do |peep|
            Post.new(id: peep['id'], message: peep['message'])
        end 
    end 

    def self.create(message:)
        if ENV['RACK_ENV'] == 'test'
            connection = PG.connect(dbname: 'chitter_2_test')
          else
            connection = PG.connect(dbname: 'chitter_2')
          end

        result = connection.exec("INSERT INTO chitter_messages (message) VALUES('#{message}') RETURNING id, message;")
        Post.new(id: result[0]['id'], message: result[0]['message'])
    end 
end 