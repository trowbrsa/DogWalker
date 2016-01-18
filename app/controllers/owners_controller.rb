class OwnersController < ApplicationController


  def home
    @bg = "bg-1"
  end

  def index
    @bg = "bg-2"
    @user = User.find(session[:user_id]) if session[:user_id]
    @owner = Owner.find(params[:owner_id])
    @pets = @owner.pets
  end

  def new
    @bg = "bg-3"
    @owner = Owner.new
    @action = :create
  end

  def create
    owner = Owner.create(owner_params[:owner])
    redirect_to user_owner_path(params[:user_id], owner.id)
  end


  def edit
    @bg = "bg-4"
    id = params[:id]
    @owner = Owner.find(id)
    @action = :update
  end

  def show
    @bg = "bg-5"
    @user = User.find(params[:user_id])
    @owner = @user.owners[0]
    @pets = @owner.pets[0]
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
    params.permit(owner:[:id, :first_name, :last_name, :user_id, :bio])
  end

end
