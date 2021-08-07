class Style < ApplicationRecord

  attachment :image

  belongs_to :user

  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :tags, dependent: :destroy

  def favorited_by?(user)
   favorites.where(user_id: user.id).exists?
  end

  def self.search_for(search, word)
    if search == 'perfect_match'
      Style.where(name: word)
    elsif search == 'forward_match'
      Style.where('name LIKE ?', word + '%')
    elsif search == 'backward_match'
      Style.where('name LIKE ?', '%' + word)
    elsif search == 'partial_match'
      Style.where('name LIKE ?', '%' + word + '%')
    else
      Style.all
    end
  end

end
