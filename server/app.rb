ENV["RACK_ENV"] ||= 'development'

require "rubygems"
require "bundler/setup"
require "sinatra/base"
require "json"

require "securerandom"
require_relative "database_connection"
require_relative "lib/adventure"

class AdventureGame < Sinatra::Base

  before do
    content_type "application/json"
  end

  get "/" do
    "Welcome, come play with us, forever and ever and ever..."
  end

  post "/login" do
    token = SecureRandom.hex
    user = User.create(token: token)
    user.to_json
  end

  get "/adventure" do
    "You wake up in the hotel, you see your tricycle, and your truck which would you like to play with?"
  end

  get "/user/:id" do
  user = User.find(params["id"])
  user.to_json
  end

  run! if app_file == $PROGRAM_NAME
end
