require 'sinatra'
require 'redis'
#require 'sinatra/reloader'

set :environment, :production

@@redis = Redis.new

get '/' do
  @title = "ARサーバ"
  @subtitle = "ARテストサーバです"

  erb :index
end

get '/picture/tanaka' do
  @title = "画像表示モード"
  @picpath = "../images/tanaka.png"

  erb :picture
end

get '/redis' do
  path = @@redis.get params[:key]
  p path
  p File.basename(path)
  #return File.basename(path)
  send_file path
end

get '/name' do
  path = @@redis.get params[:key]
  return File.basename(path)
end
