class SessionsController < ApplicationController

  def new

  end


  def create
    @user = User.find_by_email(params[:session][:email])
      if @user && @user.authenticate(params[:session][:password])
        session[:user_id] = @user.id
        owner = Owner.where(:user_id == @user.id).first
        redirect_to user_owner_path(@user, owner)
      else
        flash[:alert] = "Your username/password combination was invalid."
        redirect_to 'login'
      end
  end

  def destroy
    session[:user_id] = nil
    redirect_to "/"
  end

end
