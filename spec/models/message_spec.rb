require 'spec_helper'

describe Message, :vcr => true do
  it "saves the message to the database" do
    message = Message.new(:body => 'test message', :to => '2603378299', :from => '2602408165')
    message.save.should eq true
  end
  it 'adds an error if the to number is invalid' do
    message = Message.new(:body => 'hi', :to => '1111111', :from => '2602408165')
    message.save
    message.errors[:base]. should eq ["The 'To' number 1111111 is not a valid phone number."]
  end
end
