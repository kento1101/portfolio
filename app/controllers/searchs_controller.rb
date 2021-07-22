class SearchsController < ApplicationController
  
  def search
   @range = params[:range]
   search = params[:search]
   word = params[:word]
   
   if @range == '1'
     @item = Item Item.search(search,word)
   else
     @style = Style.search(search,word)
   end
    
  end  
  
end
