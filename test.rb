require 'sinatra'

use Rack::Auth::Basic, "Restricted Area" do |username, password|
  username == 'admin' and password == 'admin'
end

get '/' do
  "You're welcome"
end

get '/foo' do
  "You're also welcome"
end