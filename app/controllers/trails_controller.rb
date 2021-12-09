class TrailsController < ApplicationController
  
  def index
  end

  def show
    if current_user == nil
      flash.alert = "You need to be logged in."
      redirect_to root_url
    else
      @trail = Trail.find(params[:trail_id])
      @current_node = @trail.nodes.select { |node| !current_user.completed_nodes.map { |completed_node| completed_node.node_id }.include?(node.id) }.first
    end

  end

  def admin_index
    if !current_user.admin
        redirect_to root_url
    end

    @trails = Trail.all 
  end

  def admin_show
    if !current_user.admin
          redirect_to root_url
    end

    @trail = Trail.find(params[:trail_id])
  end

  def trail_new
    @trail = Trail.new
  end

  def trail_create
    @trail = Trail.new(params[:trail])
    if @trail.save
      redirect_to admin_index, notice: "Trail created!"
    else
      render "trail_new"
    end

  end
  
end


