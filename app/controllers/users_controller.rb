class UsersController < ApplicationController


  def show
    @message = Message.new
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "User created"
      redirect_to root_path
    else
      render 'new'
    end
  end

private

  def user_params
    params.require(:user).permit(:phone, :email, :password, :password_confirmation)
  end

end
