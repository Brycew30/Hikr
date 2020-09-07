class Review < ApplicationRecord
  belongs_to :trail
  belongs_to :user
  validates :stars, presence: true
  validates :title, presence: true
  validates :content, presence: true
  validates :user_id, presence: true
end
