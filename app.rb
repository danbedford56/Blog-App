require 'sinatra/base'
require 'sinatra/flash'
require_relative 'lib/chitter_board'
require_relative 'lib/user'
require_relative 'lib/database_connection_setup'

class Chitter < Sinatra::Base
  enable :sessions, :method_override
  register Sinatra::Flash

  get '/' do
    erb :index
  end

  # Post for logging into existing account
  post '/chitter' do
    if User.check_login(username: params[:username], password: params[:password])
      session[:username] = params[:username]
      redirect '/chitter_board'
    else
      flash[:pword_notice] = 'Incorrect password!'
      redirect '/'
    end
  end

  # Post for creating new account
  post '/chitter/new_user' do
    if User.check_username_taken(username: params[:username])
      User.create_user(username: params[:username], password: params[:password])
      session[:username] = params[:username]
      redirect '/chitter_board'
    else
      flash[:user_notice] = 'This username is taken!'
      redirect '/'
    end
  end

  get '/chitter_board' do
    @username = session[:username]
    @messages = ChitterBoard.all
    erb :chitter_board
  end

  get '/add_peep' do
    erb :add_peep
  end

  post '/add_peep' do
    peep = params[:message] + " -- #{session[:username]}"
    ChitterBoard.add(peep)
    redirect '/chitter_board'
  end

  delete '/chitter/:id' do
    ChitterBoard.delete(id: params[:id])
    redirect '/chitter_board'
  end
end