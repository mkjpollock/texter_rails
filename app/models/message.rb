class Message < ActiveRecord::Base
  belongs_to :contact
  before_create :send_message

private

  def send_message
    recipients = @phones
      begin
        recipients.each do |phone|
          RestClient::Request.new(
            :method => :post,
            :url => "https://api.twilio.com/2010-04-01/Accounts/#{ENV['TWILIO_ACCOUNT_SID']}/Messages.json",
            :user => ENV['TWILIO_ACCOUNT_SID'],
            :password => ENV['TWILIO_AUTH_TOKEN'],
            :payload => { :Body => body,
                          :To => phone,
                          :From => from }
            ).execute
        end
      rescue RestClient::BadRequest => error
        message = JSON.parse(error.response)['message']
        errors.add(:base, message)
        false
    end
  end
end
