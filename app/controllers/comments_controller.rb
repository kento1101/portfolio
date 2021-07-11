class CommentsController < ApplicationController
  
def create
  style = Style.find(params[:style_id])
  comment = current_user.comments.new(comment_params)
  comment.style_id= style.id
  comment.save
  redirect_to style_path(style)
end
  
  
  
def destroy
  Comment.find_by(id: params[:id], style_id: params[:style_id]).destroy
  redirect_to style_path(params[:style_id])
end


private

def comment_params
  params.require(:comment).permit(:body)
end  
  
  
end
