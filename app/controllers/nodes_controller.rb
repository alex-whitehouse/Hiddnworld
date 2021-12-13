class NodesController < ApplicationController
  
  
  def checkanswer
    node = Node.find(params[:node_id])
    if params[:answer] == node.answer || (levenshtein_distance(params[:answer], node.answer) < (node.answer.length * 0.3)) 
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

  def levenshtein_distance(s, t)
  m = s.length
  n = t.length
  return m if n == 0
  return n if m == 0
  d = Array.new(m+1) {Array.new(n+1)}

  (0..m).each {|i| d[i][0] = i}
  (0..n).each {|j| d[0][j] = j}
  (1..n).each do |j|
    (1..m).each do |i|
      d[i][j] = if s[i-1] == t[j-1]  # adjust index into string
                  d[i-1][j-1]       # no operation required
                else
                  [ d[i-1][j]+1,    # deletion
                    d[i][j-1]+1,    # insertion
                    d[i-1][j-1]+1,  # substitution
                  ].min
                end
    end
  end
  d[m][n]
end
  

def update
  @node = Node.find(params[:node][:node_id])
    if @node.update(node_params)
      redirect_to admin_show_url, notice: "Node updated!"
    else
      redirect_to admin_show_url
    end
end



  private

  def node_params
    params.require(:node).permit(:question, :answer)
  end

end
