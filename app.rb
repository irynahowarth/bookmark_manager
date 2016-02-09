require 'sinatra/base'
require 'rubygems'
require 'data_mapper'

class BookmarkManager < Sinatra::Base

  DataMapper::Logger.new($stdout, :debug)
  DataMapper.setup(:default, 'postgres://localhost/datamapper_play')

  get '/' do
    'List of links'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
