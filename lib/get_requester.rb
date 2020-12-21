# Write your code here
require 'open-uri'
require 'net/http'
require 'json'

class GetRequester

    attr_accessor :url


    def initialize(url)
        @url = url
    end

    def get_response_body
        uri = URI.parse(@url)
        response = Net::HTTP.get_response(uri)
        response.body
    end

    def parse_json
        people_array = []
        people = JSON.parse(self.get_response_body)
        people.collect do |people|
            people_array << {"name" => people["name"], "occupation" => people["occupation"]}
        end
        people_array

    end


end