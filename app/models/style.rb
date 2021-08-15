class Style < ApplicationRecord

  attachment :image

  belongs_to :user

  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :tags, dependent: :destroy

  def favorited_by?(user)
   favorites.where(user_id: user.id).exists?
  end

   def self.search(search)
      return Style.all unless search
      Style.where(['name LIKE ?', "%#{search}%"])
   end


end
