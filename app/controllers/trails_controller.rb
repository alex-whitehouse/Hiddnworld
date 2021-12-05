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
end


