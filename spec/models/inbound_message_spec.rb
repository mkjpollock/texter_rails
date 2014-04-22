require 'spec_helper'

describe SenderBot, :vcr => true do
  it 'should send a reply if a text is received' do
    response = RestClient.post "https://ykvdygzpbc.localtunnel.me/inbound_messages",
          { params: {:user => ENV['TWILIO_ACCOUNT_SID'],
                    :password => ENV['TWILIO_AUTH_TOKEN'],
                    :payload => { :Body => 'Thanks for the message!',
                                  :To => '2603378299',
                                  :From => '2602408165'}
                    }
          }
    binding.pry
  end
end
