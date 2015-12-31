class UsersController < ApplicationController

  def new
    @user = User.new
    @action = :create
  end

  def index

  end

  def show
    id = params[:id]
    @user = User.find(id)
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user.id)
    else
      redirect_to 'signup'
    end
  end


  private

  def user_params
    params.require(:user).permit(:email, :email_confirmation, :password, :password_confirmation)
  end

end
