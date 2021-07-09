class ItemsController < ApplicationController

def new
  @item = Item.new
end

def create
     item = Item.new
  if item.save
    redirect_to about_path
  else
    render new
  end
end

def index
  @items = Item.all
  
end

def show
  @item = Item.find(params[:id])
end

def edit
    @item = Item.find(params[:id])
end

def update
   item = Item.find(params[:id])
  if item.update
    redirect_to about_path
  else
    render edit
  end
end

def destroy
end



end
