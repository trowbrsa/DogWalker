class PetsController < ApplicationController

  def new
    @pet = Pet.new
    @action = :create
  end

  def create
    @pet = Pet.create(pet_params[:pet] )
    redirect_to owners_path(params[:owner_id])
  end

  def edit
    id = params[:id]
    @pet = Pet.find(id)
    @action = :update
  end

  def update
    #need owner id and pet id.
    id = params[:id]
    pet = Pet.find(id)
    owner_id = pet.owner_id
    Pet.update(params[:id], pet_params[:pet])
    redirect_to owner_path(owner_id)
  end

  def destroy
    id = params[:id]
    pet = Pet.find(id)
    owner_id = pet.owner_id
    Pet.destroy(params[:id])
    redirect_to owner_path(owner_id)
  end

  private

  def pet_params
    params.permit(pet:[:name, :bio, :walk_frequency, :owner_id])
  end

end
