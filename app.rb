require 'sinatra/base'
require 'sinatra/reloader'
require './lib/post'

class ChitterManager < Sinatra::Base
    configure :development do
        register Sinatra::Reloader
    end
    
    get '/' do 
        'Chitter'
    end

    get '/chitter' do
        @posts = Post.all 
        erb :'chitter/index'
    end 

    get '/chitter/new' do
        erb :'chitter/new'
    end

    post '/chitter' do
        message = params['message']
        connection = PG.connect(dbname: 'chitter_2_test')
        connection.exec("INSERT INTO chitter_messages (message) VALUES('#{message}')")
        redirect '/chitter'
    end


    run! if app_file == $0
end 

