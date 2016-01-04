class PetsController < ApplicationController

  def new
    @bg = "bg-6"
    @pet = Pet.new
    @action = :create
  end

  def create
    @pet = Pet.create(pet_params[:pet])
    redirect_to user_owner_path(params[:user_id], @pet.owner_id)
  end


  def edit
    @bg = "bg-7"
    id = params[:id]
    @pet = Pet.find(id)
    @action = :update
  end


  def update
    #need owner id and pet id.
    id = params[:id]
    pet = Pet.find(id)
    owner = pet.owner_id
    pet.update(
      name: pet_params[:pet][:name],
      bio: pet_params[:pet][:bio],
      walk_frequency: pet_params[:pet][:walk_frequency],
      image: pet_params[:pet][:image]
    )
    redirect_to user_owner_path(params[:user_id], owner)
  end


  def destroy
    id = params[:id]
    pet = Pet.find(id)
    owner_id = pet.owner_id
    Pet.destroy(params[:id])
    redirect_to user_owner_path(params[:user_id], owner_id)
  end

  private

  def pet_params
    params.permit(pet:[:name, :bio, :walk_frequency, :owner_id, :image, :user_id])
  end

end
