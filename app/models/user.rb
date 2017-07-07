class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  before_save { self.email = email.downcase }
  before_save { self.role ||= :member }



  has_many :shelves, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_bookmarks, through: :likes, source: :bookmark

  enum role: [:member, :admin]

  def like_for(bookmark)
    likes.where(bookmark: bookmark).first
  end

  def avatar_url(size)
     gravatar_id = Digest::MD5::hexdigest(self.email).downcase
     "http://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}"
  end
end
