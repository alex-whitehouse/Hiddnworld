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
end
