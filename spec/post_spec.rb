require 'post'

describe Post do
    describe '.all' do
        it 'returns all posts' do 
            posts = Post.all 
            expect(posts).to include("Test Post 1")
        end 
    end
end 