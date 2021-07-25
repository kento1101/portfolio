class CommentsController < ApplicationController

def create
  @style = Style.find(params[:style_id])
  @comment = current_user.comments.new(comment_params)
  @comment.style_id = @style.id
  @comment.save

end


def destroy
   @style = Style.find(params[:style_id])
  @comment=Comment.find_by(id: params[:id], style_id: params[:style_id])
  @comment.destroy

end


private

def comment_params
  params.require(:comment).permit(:body)
end


end
