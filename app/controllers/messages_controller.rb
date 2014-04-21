class MessagesController < ApplicationController

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      flash[:notice] = "Message sent!"
      redirect_to root_path
    else
      flash[:error] = "There was an error"
      render 'new'
    end
  end

private

  def message_params
    params.require(:message).permit(:body, :to, :from)
  end

end
