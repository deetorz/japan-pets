class PetsController < ApplicationController
  def index
    @pagy, @pets = pagy(Pet.all.order(created_at: :desc))
  end

  def show
  end

  @all_pets = []
end
