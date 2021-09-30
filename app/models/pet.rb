class Pet < ApplicationRecord
  include ActionView::Helpers::TextHelper
  validates :animal, presence: true
  has_one_attached :photo
  @all_pets = []

end
