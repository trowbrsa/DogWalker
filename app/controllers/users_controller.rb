class UsersController < ApplicationController

  def new
    @bg = "bg-9"
    @user = User.new
    @action = :create
  end

  def index
    @bg = "bg-10"
  end

  def show
    @bg = "bg-11"
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
    params.require(:user).permit(:email, :password)
  end

end
