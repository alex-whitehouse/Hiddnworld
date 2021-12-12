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
    @node = Node.new
  end

  def trail_new
    @trail = Trail.new
  end

  def trail_create
    @trail = Trail.new(trail_params)

    if @trail.save
      redirect_to admin_url, notice: "Trail created!"
    else
      render "trail_new"
    end
  end 


  def node_create
    @node = Node.new(node_params)
    
    if @node.save
      redirect_to admin_show_url, notice: "Node created!"
    else 
      redirect_to admin_show_url
    end
  end











  private 
  
  def trail_params
    params.require(:trail).permit(:name)
  end

  def node_params
    params.require(:node).permit(:trail_id, :question, :answer, :hint)
  end


 

end

