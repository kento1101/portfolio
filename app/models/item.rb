class Item < ApplicationRecord
  
  attachment :image
   belongs_to :user
   
   
  
  def self.search_for(search, word)
    if search == 'perfect_match'
      Item.where(name: word)
    elsif search == 'forward_match'
      Item.where('name LIKE ?', word + '%')
    elsif search == 'backward_match'
      Item.where('name LIKE ?', '%' + word)
    elsif search == 'partial_match'
      Item.where('name LIKE ?', '%' + word + '%')
    else
      Item.all
    end
  end

   
end
