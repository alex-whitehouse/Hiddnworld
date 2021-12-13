class NodesController < ApplicationController
  
  
  def checkanswer
    node = Node.find(params[:node_id])
    if params[:answer] == node.answer
      flash.alert = "Answer was correct!"
      CompletedNode.create(user_id: current_user.id, node_id: node.id)
    else
      flash.alert = "Answer was incorrect."
    end 
    redirect_to node.trail
  end

  def edit
    @node = Node.find(params[:node_id])
  end
  

def update
  @node = Node.find(params[:node_id])
    if @node.update(node_params)
      redirect_to admin_show_url, notice: "Node updated!"
    else
      redirect_to admin_show_url
    end
end



  private

  def node_params
    params.require(:node).permit(:node_id, :question, :answer, :hint)
  end

end
