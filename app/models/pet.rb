class Pet < ApplicationRecord
  validates :name, presence: true
  validates :animal, presence: true
  has_one_attached :photo
end
