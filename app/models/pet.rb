class Pet < ApplicationRecord
  require "open-uri"
  require "nokogiri"
  validates :name, presence: true
  validates :animal, presence: true


end
