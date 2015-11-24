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


end
