class BigFiveResultsTextSerializer
	def initialize(str)
		@bigFiveInput = str
	end
	def hash
		@bigFiveOutput = {
			'NAME' => 'Dominique Moreno-Baltierra',
			'EMAIL' => 'conejoplata@gmail.com'
		}
		@scores = @bigFiveInput.scan(/\n+\.*[-A-Za-z\s+]+\.+[0-9]+/)
		@scores.each do |score|
			score = score.gsub(/\r?\n?/, "")
			@splitLine = score.split(/\.+/)

			if @splitLine[0][/[A-Z\s]+/]
				@category = @splitLine[0]
				@scoreNumber = @splitLine[1]
				@bigFiveOutput[@category] = Hash.new 
				@bigFiveOutput[@category]['Overall Score'] = @scoreNumber
				@bigFiveOutput[@category]['Facets'] = Hash.new
			else
				@subcat = @splitLine[1]
				@scoreNumber = @splitLine[2]
				@bigFiveOutput[@category]['Facets'][@subcat] = @scoreNumber
			end
				
		end 
		@bigFiveOutput
	end
end
