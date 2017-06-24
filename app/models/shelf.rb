class Shelf < ActiveRecord::Base
  belongs_to :user
    has_many :bookmarks, dependent: :destroy

  default_scope { order('title DESC') }
end
