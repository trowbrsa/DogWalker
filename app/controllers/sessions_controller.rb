class SessionsController < ApplicationController

  def new

  end

  def create
    @owner = Owner.find_by_email(params[:session][:email])
      if @owner && @owner.authenticate(params[:session][:password])
        session[:owner_id] = @owner.id
        redirect_to owners_path
      else
        redirect_to 'login'
      end
  end

  def destroy
    session[:owner_id] = nil
    redirect_to "/"
  end

end
