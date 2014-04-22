class MessagesController < ApplicationController

  def new
    @message = Message.new
    if current_user != nil
      @contacts = current_user.contacts
    end
  end

  def create
    phones = params[:message][:to]
    phones.each do |phone|
      @sender_contact = User.find_by_phone(params[:message][:from])
      @receiver_contact = User.find_by_phone(phone)
      @contact = Contact.where(:user_id => @sender_contact.id, :receiver_id => @receiver_contact).first
      @message = Message.new(:body => params[:message][:body], :to => phone, :from => @sender_contact.phone)
      if @message.save
        if @receiver_contact != nil
          @message.update(:contact_id => @contact.id)
        end
      end
    end
    flash[:notice] = "Message(s) sent!"
    redirect_to root_path
  end

private

  def message_params
    params.require(:message).permit(:body, :to, :from)
  end

end
