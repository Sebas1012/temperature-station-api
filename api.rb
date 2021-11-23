require 'pg'
require 'sinatra'
require 'sinatra/reloader'
require 'dotenv'
require 'json'

Dotemv.load('.env')

set :bind, '0.0.0.0'
set :server, :puma

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
