class MessagesController < ApplicationController

  def new
    @message = Message.new
    if current_user != nil
      @contacts = current_user.contacts
    end
  end

  def create
    @sender_contact = User.find_by_phone(params[:message][:from])
    @receiver_contact = User.find_by_phone(params[:message][:to])
    @contact = Contact.where(:user_id => @sender_contact.id, :receiver_id => @receiver_contact).first
    @message = Message.new(message_params)
    if @message.save
      @message.update(:contact_id => @contact.id)
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
