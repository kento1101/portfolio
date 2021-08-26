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
       likings = Style.find(likes)
       @like_styles = Kaminari.paginate_array(likings).page(params[:page]).per(8)
 end

 def comments
       comments = Comment.where(user_id: current_user.id).pluck(:style_id)
       commentings = Style.find(comments)
      @comment_styles = Kaminari.paginate_array(commentings).page(params[:page]).per(8)
 end

  def followings
    @user = User.find(params[:id])
    @users = @user.followings
  end

  def followers
    @user = User.find(params[:id])
    @users = @user.followers
  end


private

  def user_params
    params.require(:user).permit(:name, :email, :introduction, :image)
  end

end
