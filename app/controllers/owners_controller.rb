class OwnersController < ApplicationController

  before_action :require_user, only:[:index, :show]

  def home

  end

  def index
    @owner = Owner.find(session[:owner_id]) if session[:owner_id]
    @pets = @owner.pets
  end

  def new
    @owner = Owner.new
    @action = :create
  end

  def create
    @owner = Owner.new(owner_params)
    if @owner.save
      session[:owner_id] = @owner.id
      redirect_to '/owners'
    else
      redirect_to 'signup'
    end
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
    Owner.update(params[:id], owner_params[:owner])
    redirect_to owner_path(params[:id])
  end

  def destroy
    Owner.destroy(params[:id])
    redirect_to owners_path
  end

  private

  def owner_params
    params.permit(owner:[:name, :email, :bio, :password])
  end

end
