class OwnersController < ApplicationController


  def home

  end

  def index
    @user = User.find(session[:user_id]) if session[:user_id]
    @owner = Owner.find(params[:owner_id])
    @pets = @owner.pets
  end

  def new
    @owner = Owner.new
    @action = :create
  end

  def create
    owner = Owner.create(owner_params[:owner])
    redirect_to user_owner_path(params[:user_id], owner.id)
  end


  def edit
    id = params[:id]
    @owner = Owner.find(id)
    @action = :update
  end

  def show
    @owner = Owner.find(params[:id])
    @pets = @owner.pets
  end

  def update
    Owner.update(params[:id], owner_params[:owner])
    redirect_to owner_path(params[:id])
  end

  def destroy
    Owner.destroy(params[:id])
    redirect_to owners_path
  end

  private

  def owner_params
    params.permit(owner:[:id, :first_name, :last_name, :user_id, :bio, :owner_id])
  end

end
