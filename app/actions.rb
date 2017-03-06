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
  @message = Message.new
  erb :'messages/new'
end

# Message Posts
post '/messages' do
  @message = Message.new(
    title: params[:title],
    content: params[:content],
    author:  params[:author]
  )
  # @message.save
  # redirect '/messages'
  if @message.save 
    redirect '/messages'
  else
    erb :'messages/new'
  end
end

# Message Detail
get '/messages/:id' do
  @message = Message.find params[:id]
  erb :'messages/show'
end