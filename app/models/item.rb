class Item < ApplicationRecord
  
  attachment :image
   belongs_to :user
end
