class UsersController < ApplicationController

  def show
   @user = User.find(params[:id])
   @styles = Kaminari.paginate_array(@user.styles).page(params[:page]).per(4)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    if user.update(user_params)
     redirect_to user_path(user.id)
    else
     render edit
    end
  end

  def alert
   @user = User.find(params[:id])
  end

  def withdraw
      @user = User.find(params[:id])
      @user.update(is_valid: false)
      reset_session
      redirect_to root_path
  end

 def likes
       likes = Favorite.where(user_id: current_user.id).pluck(:style_id)
       @like_styles = Style.find(likes)
 end

 def comments
       comments = Comment.where(user_id: current_user.id).pluck(:style_id)
       @comment_styles = Style.find(comments)

 end


private

  def user_params
    params.require(:user).permit(:name, :email, :introduction, :image)
  end

end
