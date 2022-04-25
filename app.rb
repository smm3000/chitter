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

    run! if app_file == $0
end 

