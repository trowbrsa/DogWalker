class WalkersController < ApplicationController

  def new
    @bg = "bg-12"
    @walker = Walker.new
    @action = :create
  end

  def create
    walker = Walker.create(walker_params[:walker])
    redirect_to user_walker_path(params[:user_id], walker.id)
  end

  def show
    @bg = "bg-13"
    @walker = Walker.find(params[:id])
  end

  private

  def walker_params
    params.permit(walker:[:id, :first_name, :last_name, :user_id, :bio, :walker_id])
  end

end
