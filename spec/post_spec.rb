require 'post'

describe Post do
    describe '.all' do
        it 'returns all posts' do 
            connection = PG.connect(dbname: 'chitter_2_test')
            connection.exec("INSERT INTO chitter_messages (message) VALUES ('TEST POST 1');")
            posts = Post.all 
            expect(posts).to include("TEST POST 1")
        end 
    end
end 