require 'sinatra'
require 'sinatra/reloader'

NUMBER = rand(100)

get '/' do
  guess = params["guess"]
  message = check_guess(guess)
  erb :index, :locals =>{:number => NUMBER, :message => message, :background_color => @background_color}
end

def check_guess(guess)
  variation = guess.to_i - NUMBER
  if variation > 0
    find_how_far(variation, "high")
  elsif variation < 0
    find_how_far(variation, "low")
  else
    @background_color = "lightgreen"
    message = "The SECRET NUMBER is #{NUMBER}. You got it right!"
  end
end

def find_how_far(variation, high_or_low)
  @@guess - 1
  if variation.abs > 5
    @background_color = "crimson"
    message = "Way too #{high_or_low}!"
  else
    @background_color = "darksalmon"
    message = "Too #{high_or_low}!"
  end
end
