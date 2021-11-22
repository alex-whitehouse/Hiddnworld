class TrailsController < ApplicationController
  def index
  end

  def show
    @trail = Trail.find(params[:trail_id])
  end
end
