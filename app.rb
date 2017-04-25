#!/usr/bin/env ruby
require_relative "bigFiveResultsTextSerializer"
require_relative "bigFiveResultsPoster"

def submitBigFiveResults
	textResults = File.read("results.txt")
	textSerializer = BigFiveResultsTextSerializer.new(textResults)
	results = textSerializer.hash

	poster = BigFiveResultsPoster.new(results)
	poster.post
end

submitBigFiveResults
