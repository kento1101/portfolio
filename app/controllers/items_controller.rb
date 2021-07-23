class ItemsController < ApplicationController

def new
  @item = Item.new
end

def create
     item = Item.new(item_params)
     item.user_id = current_user.id
  if item.save
    redirect_to item_path(item.id)
  else
    render new
  end
end

def index
  @my_items = current_user.items.page(params[:page]).per(8)

end

def show
  @item = Item.find(params[:id])
end

def edit
    @item = Item.find(params[:id])
end

def update
   item = Item.find(params[:id])
  if item.update(item_params)
    redirect_to item_path(item.id)
  else
    render edit
  end
end

def destroy
   item = Item.find(params[:id])
   item.destroy
   redirect_to items_path
end


private

def item_params
  params.require(:item).permit(:name, :detail, :image)
end

end
