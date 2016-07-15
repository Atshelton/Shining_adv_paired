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

  post "/login" do
    token = SecureRandom.hex

    User.create(token: token)

    {token: token}.to_json
  end


  run! if app_file == $PROGRAM_NAME
end
