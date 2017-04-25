require 'json'
require 'net/http'
require 'uri'

class BigFiveResultsPoster
	attr_reader :response_code, :token

	def initialize(hash)
		@url = URI.parse('https://recruitbot.trikeapps.com/api/v1/roles/mid-senior-web-developer/big_five_profile_submissions')
		@header = {'Content-Type' => 'application/json'}
		@bigFiveJson = hash.to_json
	end

	def post
		http = Net::HTTP.new(@url.host, @url.port)
		http.use_ssl = true
		request = Net::HTTP::Post.new(@url.path, @header)
		request.body = @bigFiveJson

		response = http.request(request)

		@response_code = response.code
		@token = response.body

		@response_code == "201"
	end
end
