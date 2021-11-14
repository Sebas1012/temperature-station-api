require 'dotenv'
require 'pg'
require 'sinatra'
require 'sinatra/reloader'
require 'json'

Dotenv.load('.env')

conn = PG.connect(:dbname => ENV['DB_NAME'], :host => ENV['DB_HOST'], :port => ENV['DB_PORT'], :user => ENV['DB_USER'], :password => ENV['DB_PASS'])

p conn.server_version

before do
  content_type :json
end

# TODO: Solucionar esta "chapuza"
get '/temperature' do
  conn.exec("SELECT * FROM temperature").each{|row| @res = row}
  @res.to_json
end
