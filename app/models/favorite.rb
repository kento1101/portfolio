class Favorite < ApplicationRecord

  belongs_to :user
   belongs_to :style

   attachment :image

end