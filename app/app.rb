ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'data_mapper_setup'

class BookmarkManager < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    erb :index
  end

  get '/links' do
    @links = Link.all
    erb :'links/index'
  end

  get '/links/new' do
    erb :'links/new'
  end

  post '/links' do
    link = Link.create(url: params[:url], title: params[:title])
    params[:tags].split.each do |item|
      link.tags << Tag.create(tag: item)
    end
    link.save
    redirect to '/links'
  end

  get '/tags/:tag' do
    tag = Tag.first(tag: params[:tag])
    @links = tag ? tag.links : []
    erb :'links/index'
  end

  get '/signup' do
    erb :'users/new'
  end

  post '/users' do
      user = User.create(email: params[:email],
                     password: params[:password],
                     password_confirmation: params[:verify_password])
      session[:user_id] = user.id
      redirect to('/links')
  end




  get '/users' do
    @user = User.first
    erb :'users/index'
  end

  helpers do
   def current_user
     @current_user ||= User.get(session[:user_id])
   end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
