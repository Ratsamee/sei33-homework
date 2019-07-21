require 'sinatra'
require 'sinatra/reloader'
require 'httparty'
require 'pry'



get '/' do
  erb :home
end

get '/result' do
  @title = params[:title].capitalize #input name
  book_url = "https://www.googleapis.com/books/v1/volumes?q=title:#{ @title }"
  @info = HTTParty.get book_url;
  @cover_image = @info["items"][0]["volumeInfo"]["imageLinks"]["thumbnail"]
  erb :result
end
