require 'sinatra'

get '/' do
  "The secret number is this #{rand(100)}"
end
