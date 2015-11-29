class UsersController < ApplicationController

  def new
    @user = User.new
    @action = :create
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_owners_path(@user.id)
    else
      redirect_to 'signup'
    end
  end


  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password_digest)
  end

end
