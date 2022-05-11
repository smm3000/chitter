require 'sinatra/base'
require 'sinatra/reloader'
require './lib/post'

class ChitterManager < Sinatra::Base
    configure :development do
        register Sinatra::Reloader
    end
    
    get '/' do 
        'Welcome to Chitter'
    end

    get '/chitter' do
        @posts = Post.all 
        erb :'chitter/index'
    end 

    get '/chitter/new' do
        erb :'chitter/new'
    end

    post '/chitter' do
        Post.create(message: params[:message])
        redirect '/chitter'
    end

    run! if app_file == $0
end 

