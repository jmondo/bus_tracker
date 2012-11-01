require 'sinatra'
require 'json'

get '/' do
  hash = {value: {inbound: [15, 34, 14], outbound: [13, 22, 34]}}
  hash.to_json
end
