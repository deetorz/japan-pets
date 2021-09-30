# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@all_pets = []
Pet.destroy_all

def dog1
  puts "Adding dogs..."
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
    name = name[7..-1]
    breed = dog_doc.search("tbody td")[0].text.strip
    gender = dog_doc.search("tbody td")[1].text.strip
    age = dog_doc.search("tbody td")[2].text.strip
    description = []
      dog_doc.search(".data_area_txt p").each do |p|
        description << p.text.strip
      end
    pet = Pet.create(name: name, animal: animal, age: age, breed: breed, gender: gender, url: dog_url, description: description.join)
    @all_pets << pet
    img_link = element.search("dt img").attribute("src").value.strip
    file1 = URI.open("#{img_link}")
    pet.photo.attach(io: file1, filename: "dog#{@all_pets.index(@all_pets.last)}.jpeg", content_type: 'image/jpeg')
  end
  puts "Dogs added"
end

def dog2
  puts "Adding dogs..."
  url = "http://chibawan.net/dogdetailscat/dog/page/2"
  html = URI.open(url).read
  doc = Nokogiri::HTML(html, nil, "utf-8")
  doc.search(".list dl").each do |element|
    animal = "dog"
    dog_url = element.search("h1 a").first.attribute("href").value.strip
    dog_url = dog_url.gsub(" ", "-") if dog_url.include?(" ")
    dog_html = URI.open("#{dog_url}").read
    dog_doc = Nokogiri::HTML(dog_html, nil, "utf-8")
    name = dog_doc.search('.dogdetails h1').first.text.strip
    name = name[7..-1]
    breed = dog_doc.search("tbody td")[0].text.strip
    gender = dog_doc.search("tbody td")[1].text.strip
    age = dog_doc.search("tbody td")[2].text.strip
    description = []
    dog_doc.search(".data_area_txt p").each do |p|
      description << p.text.strip
    end
    pet = Pet.create(name: name, animal: animal, age: age, breed: breed, gender: gender, url: dog_url, description: description.join)
    @all_pets << pet
    img_link = element.search("dt img").attribute("src").value.strip
    file1 = URI.open("#{img_link}")
    pet.photo.attach(io: file1, filename: "dog#{@all_pets.index(@all_pets.last)}.jpeg", content_type: 'image/jpeg')
  end
  puts "Dogs added"
end

def cat1
  puts "Adding cats..."
  url = "https://japancatnetwork.org"
  html = URI.open(url).read
  doc = Nokogiri::HTML(html, nil, "utf-8")

  doc.search(".img-portfolio").each do |element|
    unless element.search('h3 a').first.text.strip.include?("ADOPTED")
      name = element.search('h3 a').first.text.strip
      animal = "cat"
      cat_url = element.search("h3 a").first.attribute("href").value.strip
      cat_url = cat_url.gsub(" ", "%20") if cat_url.include?(" ")
      cat_html = URI.open("#{url}#{cat_url}").read
      cat_doc = Nokogiri::HTML(cat_html, nil, "utf-8")
      gender = cat_doc.search("td").first.text.strip
      description = cat_doc.search("tr")[3].search("td p").first.text.strip
      pet = Pet.create(name: name, animal: animal, gender: gender, url: "https://japancatnetwork.org#{cat_url}", description: description)
      @all_pets << pet
      unless cat_doc.search("#petGallery a").first.nil?
        img_link = cat_doc.search("#petGallery a").first.attribute("href").value.strip
        file1 = URI.open("#{url}#{img_link}")
        pet.photo.attach(io: file1, filename: "cat#{@all_pets.index(@all_pets.last)}.jpeg", content_type: 'image/jpeg')
      end
    end
  end
  puts "Cats added"
end

def cat2
  puts "Adding cats..."
  url = "https://chibawan.net/catdetailscat/cat"
  html = URI.open(url).read
  doc = Nokogiri::HTML(html, nil, "utf-8")
  doc.search(".list dl").each do |element|
    animal = "cat"
    cat_url = element.search("h1 a").first.attribute("href").value.strip
    cat_url = cat_url.gsub(" ", "-") if cat_url.include?(" ")
    cat_html = URI.open("#{cat_url}").read
    cat_doc = Nokogiri::HTML(cat_html, nil, "utf-8")
    name = cat_doc.search('.catdetails h1').first.text.strip
    name = name[7..-1]
    breed = cat_doc.search("tbody td")[0].text.strip
    gender = cat_doc.search("tbody td")[1].text.strip
    age = cat_doc.search("tbody td")[2].text.strip
    description = []
    cat_doc.search(".data_area_txt p").each do |p|
      description << p.text.strip
    end
    pet = Pet.create(name: name, animal: animal, age: age, breed: breed, gender: gender, url: cat_url, description: description.join)
    @all_pets << pet
    img_link = element.search("dt img").attribute("src").value.strip
    file1 = URI.open("#{img_link}")
    pet.photo.attach(io: file1, filename: "cat#{@all_pets.index(@all_pets.last)}.jpeg", content_type: 'image/jpeg')
  end
  puts "Cats added"
end

def cat3
  puts "Adding cats..."
  url = "https://chibawan.net/catdetailscat/cat/page/2"
  html = URI.open(url).read
  doc = Nokogiri::HTML(html, nil, "utf-8")
  doc.search(".list dl").each do |element|
    animal = "cat"
    cat_url = element.search("h1 a").first.attribute("href").value.strip
    cat_url = cat_url.gsub(" ", "-") if cat_url.include?(" ")
    cat_html = URI.open("#{cat_url}").read
    cat_doc = Nokogiri::HTML(cat_html, nil, "utf-8")
    name = cat_doc.search('.catdetails h1').first.text.strip
    name = name[7..-1]
    breed = cat_doc.search("tbody td")[0].text.strip
    gender = cat_doc.search("tbody td")[1].text.strip
    age = cat_doc.search("tbody td")[2].text.strip
    description = []
    cat_doc.search(".data_area_txt p").each do |p|
      description << p.text.strip
    end
    pet = Pet.create(name: name, animal: animal, age: age, breed: breed, gender: gender, url: cat_url, description: description.join)
    @all_pets << pet
    img_link = element.search("dt img").attribute("src").value.strip
    file1 = URI.open("#{img_link}")
    pet.photo.attach(io: file1, filename: "cat#{@all_pets.index(@all_pets.last)}.jpeg", content_type: 'image/jpeg')
  end
  puts "Cats added"
end

def cat4
  puts "Adding cats..."
  url = "http://www.arkbark.net/en/adopt/catsosaka/"
  sub_url = "http://www.arkbark.net"
  html = URI.open(url)
  doc = Nokogiri::HTML(html, nil, "utf-8")
  doc.search("#animalList li").each do |element|
    cat_url = element.search("a").first.attribute("href").value.strip
    cat_url = cat_url.gsub(" ", "-") if cat_url.include?(" ")
    cat_html = URI.open(cat_url.to_s)
    cat_doc = Nokogiri::HTML(cat_html, nil, "utf-8")
    animal = 'cat'
    name = cat_doc.search('.tit').text.strip
    location = cat_doc.search("tbody td")[2].text.strip
    gender = cat_doc.search("tbody td")[3].text.strip
    age = cat_doc.search("tbody td")[4].text.strip
    description = cat_doc.search("tbody td")[7].text.strip
    pet = Pet.create(name: name, animal: animal, age: age, gender: gender, url: cat_url, description: description,
                     location: location)
    @all_pets << pet
    img_link = element.search("img").first.attribute("src").value.strip
    encoded_img_link = []
    img_link.chars.each do |char|
      char = CGI.escape(char) if char != "/"
      encoded_img_link << char
    end
    img_url = sub_url + encoded_img_link.join

    file1 = URI.open(img_url)
    pet.photo.attach(io: file1, filename: "cat#{@all_pets.index(@all_pets.last)}.jpg", content_type: 'image/jpg')
  end
  puts "Cats added"
end

dog1
dog2
cat1
cat2
cat3
cat4

puts "Database seeded... #{Pet.count} pets added!"
