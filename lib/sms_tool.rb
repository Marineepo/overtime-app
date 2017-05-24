module SmsTool
	account_sid = ENV['AC00eb4e7de93c7434625757d742c06efd']
	auth_token = ENV['9d7c7042ea77df01c1389d4be6bcc413']
	
	@client = Twilio::REST::Client.new account_sid, auth_token
	
	def self.send_sms(number:, message:)
		@client.message.create(
			from: ENV[TWILIO_PHONE_NUMBER],
			to: "+1#{number}",
			body: "#{message}"
		)
	end
end

# SmsTool.send_sms(number: '12393510443', message: "Look at me I am in a text!")
# do rails c and then pass in all of line 16 once you insert token and SID