class ContactsController < ApplicationController

  def new
    @contact = Contact.new
  end

  def create
    @receiver = User.find_by_email(params[:email])
    @contact = Contact.new(:receiver_id => @receiver.id, :user_id => current_user.id)
    if @contact.save
      redirect_to root_path
    else
      render 'new'
    end
  end

private
  def contact_params
    params.require(:contact).permit(:user_id, :receiver_id, :email)
  end
end
