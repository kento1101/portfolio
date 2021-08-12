class StylesController < ApplicationController

def new
  @style = Style.new
end

def create
    style = Style.new(style_params)
    style.user_id = current_user.id
    if style.save
       tags = Vision.get_image_data(style.image)
    　 tags.each do |tag|
       style.tags.create(name: tag)
    　 end
       redirect_to style_path(style.id)
    else
       render new
    end
end

def index
styles = Style.includes(:favorites).sort{|a,b|b.favorites.size <=> a.favorites.size}
@all_ranks= Kaminari.paginate_array(styles).page(params[:page]).per(8)
end

def show
  @style = Style.find(params[:id])
  @comment = Comment.new
  @style_comments = @style.comments.page(params[:page]).per(5)
end

def edit
    @style = Style.find(params[:id])
end

def update
   style = Style.find(params[:id])
  if style.update(style_params)
    redirect_to style_path(style.id)
  else
    render edit
  end
end

def destroy
   style = Style.find(params[:id])
   style.destroy
   redirect_to styles_path
end


private

def style_params
  params.require(:style).permit(:name, :detail, :image)
end

end
