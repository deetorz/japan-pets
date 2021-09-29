require "test_helper"

class PetTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "valid if the name is present" do
    pet = Pet.new(name: "snoopy")
    pet.valid?
    assert_empty pet.errors[:name]
  end

  test "Name should not be blank" do
    pet = Pet.new(name: "")
    assert_not pet.valid?
  end

  test "valid if the location is present" do
    pet = Pet.new(location: "tokyo")
    pet.valid?
    assert_empty pet.errors[:location]
  end

  test "Location should not be blank" do
    pet = Pet.new(location: "")
    assert_not pet.valid?
  end

  test "valid if the animal is present" do
    pet = Pet.new(animal: "dog")
    pet.valid?
    assert_empty pet.errors[:animal]
  end

  test "Animal should not be blank" do
    pet = Pet.new(animal: "")
    assert_not pet.valid?
  end
end
