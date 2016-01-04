class SessionsController < ApplicationController

  def new
    @bg = "bg-8"
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

  def create_walker
    @user = User.find_by_email(params[:session][:email])
      if @user && @user.authenticate(params[:session][:password])
        session[:user_id] = @user.id
        walker = Walker.where(:user_id == @user.id).first
        redirect_to user_walker_path(@user, walker)
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
