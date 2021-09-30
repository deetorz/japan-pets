# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@all_pets = []
Pet.destroy_all

def cat_url1
  url = "https://japancatnetwork.org"
  html = URI.open(url).read
  doc = Nokogiri::HTML(html, nil, "utf-8")

  doc.search(".img-portfolio").each do |element|
    unless element.search('h3 a').first.text.strip.include?("ADOPTED")
      name = element.search('h3 a').first.text.strip
      animal = "cat"
      cat_url = element.search("h3 a").first.attribute("href").value.strip
      cat_url = cat_url.gsub(" ", "%20+%20") if cat_url.include?(" ")
      cat_html = URI.open("#{url}#{cat_url}").read
      cat_doc = Nokogiri::HTML(cat_html, nil, "utf-8")
      gender = cat_doc.search("td").first.text.strip
      pet = Pet.create(name: name, animal: animal, gender: gender, url: (url + cat_url))
      @all_pets << pet
      unless cat_doc.search("#petGallery a").first.nil?
        img_link = cat_doc.search("#petGallery a").first.attribute("href").value.strip
        file1 = URI.open("#{url}#{img_link}")
        pet.photo.attach(io: file1, filename: "cat#{@all_pets.index(@all_pets.last)}.jpeg", content_type: 'image/jpeg')
      end
    end
  end
end

def pet1
  url = "http://chibawan.net/dogdetailscat/dog"
  html = URI.open(url).read
  doc = Nokogiri::HTML(html, nil, "utf-8")
  doc.search(".list dl").each do |element|
    animal = "dog"
    dog_url = element.search("h1 a").first.attribute("href").value.strip
    dog_url = dog_url.gsub(" ", "-") if dog_url.include?(" ")
    dog_html = URI.open("#{dog_url}").read
    dog_doc = Nokogiri::HTML(dog_html, nil, "utf-8")
    name = dog_doc.search('.dogdetails h1').first.text.strip
    gender = dog_doc.search("tbody td")[0].text.strip
    breed = dog_doc.search("tbody td")[1].text.strip
    age = dog_doc.search("tbody td")[2].text.strip
    pet = Pet.create(name: name, animal: animal, age: age, breed: breed, gender: gender, url: (url + dog_url))
    @all_pets << pet
    img_link = element.search("dt img").attribute("src").value.strip
    file1 = URI.open("#{img_link}")
    pet.photo.attach(io: file1, filename: "dog#{@all_pets.index(@all_pets.last)}.jpeg", content_type: 'image/jpeg')
  end
end

cat_url1#(keyword)
pet1
