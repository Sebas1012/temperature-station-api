require 'bundler/setup'

Bundler.require(:production)

set :bind, '0.0.0.0'
set :server, :puma

use Rack::Auth::Basic, "Restricted Area" do |username, password|
  username == ENV['API_USER'] and password == ENV['API_PASS']
end

conn = PG.connect(:dbname => ENV['DB_NAME'], :host => ENV['DB_HOST'], :port => ENV['DB_PORT'], :user => ENV['DB_USER'], :password => ENV['DB_PASS'])

before do
  content_type :json
end

# TODO: Solucionar esta "chapuza"
get '/temperature' do
  res = conn.exec("SELECT * FROM temperature")

  data = []

  res.each{|row| data.push(row)}
  data.to_json
end

get '/temperature/:id' do
  conn.exec("SELECT * FROM temperature WHERE id = #{params[:id]}").each{|row| @res = row}
  @res.to_json
end

post '/temperature' do
  data = JSON.parse request.body.read

  conn.exec("INSERT INTO temperature(temperature, humidity, full_date, full_hour) 
            VALUES(#{data['temperature'].to_f}, #{data['humidity'].to_f}, '#{data['full_date']}', '#{data['full_hour']}')")
end

