require 'sinatra'
require 'json'
require 'httparty'

get '/' do
  content_type :json
  {potrero: predictions(0), pacific: predictions(1)}.to_json
end

def predictions(index)
  prediction_objects = [xml["body"]["predictions"][index]["direction"]].flatten.collect { |h| h["prediction"] }.flatten
  minutes = prediction_objects.collect {|p| p["minutes"]}
  minutes.sort[0..2].join(',')
end

def xml
  @xml ||= HTTParty.get('http://webservices.nextbus.com/service/publicXMLFeed?command=predictionsForMultiStops&a=sf-muni&stops=22%7c4622&stops=22%7c4621&stops=21%7c4994&stops=21%7c7423')
end
