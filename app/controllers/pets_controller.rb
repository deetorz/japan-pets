class PetsController < ApplicationController
  require "open-uri"
  require "nokogiri"

  def index
    @pets = Pet.all
  end

  def show
  end

  @all_pets = []

end
