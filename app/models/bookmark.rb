class Bookmark < ActiveRecord::Base
  belongs_to :shelf, dependent: :destroy
  belongs_to :user, dependent: :destroy
  has_many :likes, dependent: :destroy

  default_scope { order('created_at DESC') }

  def like
    likes.where(value: 1).count
  end

  def dislike
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
    user.likes.create(value: 1, post: self)
  end

  def create_favorite
    Likes.create(bookmark: self, user: self.user)
    LikeMailer.new_like(self).deliver_now
  end
end
