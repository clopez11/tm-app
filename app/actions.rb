require 'rubygems'
require 'sinatra'
require "sinatra/activerecord"

# Homepage (Root path)
get '/' do
  erb :index
end

# Messages
get '/messages' do
  erb :'messages/index'
end
