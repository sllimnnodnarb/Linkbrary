class Bookmark < ActiveRecord::Base
  belongs_to :shelf
  belongs_to :user
  has_many :likes, dependent: :destroy

  default_scope { order('created_at DESC') }

  def up_like
    likes.where(value: 1).count
  end

  def down_like
    likes.where(value: -1).count
  end

  def points
    likes.sum(:value)
  end

  def update_rank
    age_in_days = (created_at - Time.new(1970,1,1)) / 1.day.seconds
    new_rank = points + age_in_days
    update_attribute(:rank, new_rank)
  end

  private

  def create_like
    user.likes.create(bookmark: self)
    #LikeMailer.new_bookmark(self).deliver_now
  end
end
