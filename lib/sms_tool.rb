module SmsTool
	account_sid = ENV['TWILIO_ACCOUNT_SID']
	auth_token = ENV['TWILIO_ACCOUNT_SID']
	
	@client = Twilio::REST::Client.new account_sid, auth_token
	
	def self.send_sms(number:, message:)
		@client.message.create(
			from: ENV[TWILIO_PHONE_NUMBER],
			to: "+1#{number}",
			body: "#{message}"
		)
	end
end

# SmsTool.send_sms(number: '5555555555', message: "Look at me I am in a text!")
# do rails c and then pass in all of line 16 once you insert token and SID