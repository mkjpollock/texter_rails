class InboundMessagesController < ApplicationController

  skip_before_filter :verify_authenticity_token


  def create
    SenderBot.reply(params['From'])
  end


end
