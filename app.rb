require 'sinatra/base'
require './lib/message.rb'

class Messenger < Sinatra::Base
enable :sessions

  get '/' do
    session[:message] ||= []
    @message = session[:message]
    erb :index
  end

  post '/storing-message' do
    message = Message.new(params[:message])
    session[:message] << message
    redirect '/'
  end

  get '/full-message' do
    @message = session[:message]
    erb :history
  end

run! if app_file == $0
end
