require 'rubygems'
require 'sinatra'
require "sinatra/activerecord"

# Homepage (Root path)
get '/' do
  erb :index
end

# Messages
get '/messages' do
  @messages = Message.all
  erb :'messages/index'
end

# Messages New
get '/messages/new' do
  erb :'messages/new'
end

# Message Posts
post '/messages' do
  @message = Message.new(
    title: params[:title],
    content: params[:content],
    author:  params[:author]
  )
  @message.save
  redirect '/messages'
end

# Message Detail
get '/messages/:id' do
  @message = Message.find params[:id]
  erb :'messages/show'
end