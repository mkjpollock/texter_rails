class SenderBot

  def self.reply(number)
    Message.create(:from => '2602408165', :to => number, :body => "Sorry, this is not a real person! As such, I cannot text you back. Please don't be sad.")
  end

end
