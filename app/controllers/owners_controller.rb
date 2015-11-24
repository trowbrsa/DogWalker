class OwnersController < ApplicationController

  def index
    @owners = Owner.all
  end

  def new
    @owner = Owner.new
    @action = :create
  end

  def edit
    id = params[:id]
    @owner = Owner.find(id)
    @action = :update
  end

  def show
    # ID for the owner
    id = params[:id]
    @owner = Owner.find(id)
    @pets = @owner.pets
  end

  def update
    id = params[:id]
    @owner = Owner.find(id)
    @owner.update(
    name: owner_params[:owner][:name],
    email: owner_params[:owner][:email],
    bio: owner_params[:owner][:bio])
    redirect_to owner_path(params[:id])
  end
  
  def destroy
    Owner.destroy(params[:id])
    redirect_to owners_path
  end

  def owner_params
    params.permit(owner:[:name, :email, :bio])
  end

end
