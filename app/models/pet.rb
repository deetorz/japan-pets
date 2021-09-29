class Pet < ApplicationRecord

  validates :name, presence: true
  validates :animal, presence: true


end
