class Like < ActiveRecord::Base
  belongs_to :user, dependent: :destroy
  belongs_to :bookmark, dependent: :destroy
end
