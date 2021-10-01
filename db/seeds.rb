# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@all_pets = []
Pet.destroy_all

# DOGSSSSSSS


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
    breed = dog_doc.search("tbody td")[0].nil? ? 'breed undefined' : dog_doc.search("tbody td")[0].text.strip
    gender = dog_doc.search("tbody td")[1].nil? ? 'gender undefined' : dog_doc.search("tbody td")[1].text.strip
    age = dog_doc.search("tbody td")[2].nil? ? 'age undefined' : dog_doc.search("tbody td")[2].text.strip
    description = []
    if dog_doc.search(".data_area_txt p")
      dog_doc.search(".data_area_txt p").each do |p|
        description << p.text.strip
      end
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
    breed = dog_doc.search("tbody td")[0].nil? ? 'breed undefined' : dog_doc.search("tbody td")[0].text.strip
    gender = dog_doc.search("tbody td")[1].nil? ? 'gender undefined' : dog_doc.search("tbody td")[1].text.strip
    age = dog_doc.search("tbody td")[2].nil? ? 'age undefined' : dog_doc.search("tbody td")[2].text.strip
    description = []
    if dog_doc.search(".data_area_txt p")
      dog_doc.search(".data_area_txt p").each do |p|
        description << p.text.strip
      end
    end
    pet = Pet.create(name: name, animal: animal, age: age, breed: breed, gender: gender, url: dog_url, description: description.join)
    @all_pets << pet
    img_link = element.search("dt img").attribute("src").value.strip
    file1 = URI.open("#{img_link}")
    pet.photo.attach(io: file1, filename: "dog#{@all_pets.index(@all_pets.last)}.jpeg", content_type: 'image/jpeg')
  end
  puts "Dogs added"
end

def dog3
  puts "Adding dogs..."
  url = "http://www.arkbark.net/en/adopt/dogsosaka/"
  sub_url = "http://www.arkbark.net"
  html = URI.open(url)
  doc = Nokogiri::HTML(html, nil, "utf-8")
  doc.search("#animalList li").each do |element|
    dog_url = element.search("a").first.attribute("href").value.strip
    dog_url = dog_url.gsub(" ", "-") if dog_url.include?(" ")
    dog_html = URI.open(dog_url.to_s)
    dog_doc = Nokogiri::HTML(dog_html, nil, "utf-8")
    animal = 'dog'
    name = dog_doc.search('.tit').text.strip
  location = dog_doc.search("tbody td")[2].nil? ? 'location undefined' : dog_doc.search("tbody td")[2].text.strip
  gender = dog_doc.search("tbody td")[3].nil? ? 'gender undefined' : dog_doc.search("tbody td")[3].text.strip
  age = dog_doc.search("tbody td")[4].nil? ? 'age undefined' : dog_doc.search("tbody td")[4].text.strip
  description = dog_doc.search("tbody td")[7].nil? ? '' : dog_doc.search("tbody td")[7].text.strip
  pet = Pet.create(name: name, animal: animal, age: age, gender: gender, url: dog_url, description: description,
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
  pet.photo.attach(io: file1, filename: "dog#{@all_pets.index(@all_pets.last)}.jpg", content_type: 'image/jpg')
end
puts "Dogs added"
end

def dog4
puts "Adding dogs..."
url = "http://www.arkbark.net/en/adopt/dogsosaka/page/2/"
sub_url = "http://www.arkbark.net"
html = URI.open(url)
doc = Nokogiri::HTML(html, nil, "utf-8")
doc.search("#animalList li").each do |element|
  dog_url = element.search("a").first.attribute("href").value.strip
  dog_url = dog_url.gsub(" ", "-") if dog_url.include?(" ")
  dog_html = URI.open(dog_url.to_s)
  dog_doc = Nokogiri::HTML(dog_html, nil, "utf-8")
  animal = 'dog'
  name = dog_doc.search('.tit').text.strip
  location = dog_doc.search("tbody td")[2].nil? ? 'location undefined' : dog_doc.search("tbody td")[2].text.strip
  gender = dog_doc.search("tbody td")[3].nil? ? 'gender undefined' : dog_doc.search("tbody td")[3].text.strip
  age = dog_doc.search("tbody td")[4].nil? ? 'age undefined' : dog_doc.search("tbody td")[4].text.strip
  description = dog_doc.search("tbody td")[7].nil? ? '' : dog_doc.search("tbody td")[7].text.strip
  pet = Pet.create(name: name, animal: animal, age: age, gender: gender, url: dog_url, description: description,
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
  pet.photo.attach(io: file1, filename: "dog#{@all_pets.index(@all_pets.last)}.jpg", content_type: 'image/jpg')
end
puts "Dogs added"
end

def dog5
puts "Adding dogs..."
url = "http://www.arkbark.net/en/adopt/dogstokyo/"
sub_url = "http://www.arkbark.net"
html = URI.open(url)
doc = Nokogiri::HTML(html, nil, "utf-8")
doc.search("#animalList li").each do |element|
  dog_url = element.search("a").first.attribute("href").value.strip
  dog_url = dog_url.gsub(" ", "-") if dog_url.include?(" ")
  dog_html = URI.open(dog_url.to_s)
  dog_doc = Nokogiri::HTML(dog_html, nil, "utf-8")
  animal = 'dog'
  name = dog_doc.search('.tit').text.strip
  location = dog_doc.search("tbody td")[2].nil? ? 'location undefined' : dog_doc.search("tbody td")[2].text.strip
  gender = dog_doc.search("tbody td")[3].nil? ? 'gender undefined' : dog_doc.search("tbody td")[3].text.strip
  age = dog_doc.search("tbody td")[4].nil? ? 'age undefined' : dog_doc.search("tbody td")[4].text.strip
  description = dog_doc.search("tbody td")[7].nil? ? '' : dog_doc.search("tbody td")[7].text.strip
  pet = Pet.create(name: name, animal: animal, age: age, gender: gender, url: dog_url, description: description,
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
  pet.photo.attach(io: file1, filename: "dog#{@all_pets.index(@all_pets.last)}.jpg", content_type: 'image/jpg')
end
puts "Dogs added"
end

def dog6
  puts "Adding dogs..."
  url = "http://www.wanwan.org/06social/shipponet.html"
  html = URI.open(url).read
  doc = Nokogiri::HTML(html, nil, "utf-8")
  # doc.search("table tr").each_with_index do |row, index|
  (0..70).each do |index|
    if index % 3 == 0
      (0..3).each do |i|
        if doc.search("table tr")[index].search("td")[i] != nil
        name = doc.search("table tr")[index + 1].search("td")[i].text.strip
        location = doc.search("table tr")[index + 2].nil? ? '' : doc.search("table tr")[index + 2].search("td")[i].text.strip
        end
        animal = "dog"
        pet = Pet.create(name: name, animal: animal, url: url, location: location)
        @all_pets << pet
        if doc.search("table tr")[index].search("img")[i] != nil
          img_link = doc.search("table tr")[index].search("img")[i].attribute("src").value.strip
          file1 = URI.open("http://www.wanwan.org/06social/#{img_link}")
          pet.photo.attach(io: file1, filename: "dog#{@all_pets.index(@all_pets.last)}.jpeg", content_type: 'image/jpeg')
        end
        if pet.photo.attached? == false
          pet.destroy
        end
      end
    end
  end
  puts "Dogs added"
end

def dog7
  puts "Adding dogs..."
  url = "https://www.zaidan-fukuoka-douai.or.jp/personal-animals/hogo/dog"
  sub_url = "https://www.zaidan-fukuoka-douai.or.jp"
  html = URI.open(url).read
  doc = Nokogiri::HTML(html, nil, "utf-8")

  doc.search(".animals-list ul li").each do |element|
    dog_url = element.search("a").first.attribute("href").value.strip
    dog_url = dog_url.gsub(" ", "%20") if dog_url.include?(" ")
    dog_html = URI.open("#{sub_url}#{dog_url}").read
    dog_doc = Nokogiri::HTML(dog_html, nil, "utf-8")

    name = dog_doc.search('.animals-type').first.text.strip
    animal = "dog"
    description = dog_doc.search("tbody tr")[1].search('td').nil? ? "" : dog_doc.search("tbody tr")[1].search("td").first.text.strip
    gender = dog_doc.search("tbody tr")[3].search('td').nil? ? 'gender undefined' : dog_doc.search("tbody tr")[3].search('td').text.strip
    age = dog_doc.search("tbody tr")[5].search('td').nil? ? 'gender undefined' : dog_doc.search("tbody tr")[5].search('td').text.strip
    pet = Pet.create(name: name, animal: animal, age: age, gender: gender, url: "#{sub_url}#{dog_url}", description: description)
    @all_pets << pet

    img_link = element.search("figure img").attribute("src").value.strip
    file1 = URI.open("#{sub_url}#{img_link}")
    pet.photo.attach(io: file1, filename: "dog#{@all_pets.index(@all_pets.last)}.jpeg", content_type: 'image/jpeg')
  end
  puts "Dogs(fukuoka) added"
end

def dog8
  puts "Adding dogs..."
  url = "https://www.zaidan-fukuoka-douai.or.jp/animals/centers/dog"
  sub_url = "https://www.zaidan-fukuoka-douai.or.jp"
  html = URI.open(url).read
  doc = Nokogiri::HTML(html, nil, "utf-8")

  doc.search(".animals-list ul li").each do |element|
    dog_url = element.search("a").first.attribute("href").value.strip
    dog_url = dog_url.gsub(" ", "%20") if dog_url.include?(" ")
    dog_html = URI.open("#{sub_url}#{dog_url}").read
    dog_doc = Nokogiri::HTML(dog_html, nil, "utf-8")

    name = dog_doc.search('.animals-type').first.text.strip
    animal = "dog"
    description = dog_doc.search("tbody tr")[1].search('td').nil? ? "" : dog_doc.search("tbody tr")[1].search("td").first.text.strip
    gender = dog_doc.search("tbody tr")[3].search('td').nil? ? 'gender undefined' : dog_doc.search("tbody tr")[3].search('td').text.strip
    age = dog_doc.search("tbody tr")[5].search('td').nil? ? 'gender undefined' : dog_doc.search("tbody tr")[5].search('td').text.strip
    pet = Pet.create(name: name, animal: animal, age: age, gender: gender, url: "#{sub_url}#{dog_url}", description: description)
    @all_pets << pet

    img_link = element.search("figure img").attribute("src").value.strip
    file1 = URI.open("#{sub_url}#{img_link}")
    pet.photo.attach(io: file1, filename: "dog#{@all_pets.index(@all_pets.last)}.jpeg", content_type: 'image/jpeg')
  end
  puts "Dogs(fukuoka) added"
end

# CATTSSSSSS


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
      description = cat_doc.search("tr")[3].search("td p").nil? ? '' : cat_doc.search("tr")[3].search("td p").first.text.strip
      gender = cat_doc.search("td").nil? ? 'gender undefined' : cat_doc.search("td").first.text.strip
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
    breed = cat_doc.search("tbody td")[0].nil? ? 'breed undefined' : cat_doc.search("tbody td")[0].text.strip
    gender = cat_doc.search("tbody td")[1].nil? ? 'gender undefined' : cat_doc.search("tbody td")[1].text.strip
    age = cat_doc.search("tbody td")[2].nil? ? 'age undefined' : cat_doc.search("tbody td")[2].text.strip
    description = []
    if cat_doc.search(".data_area_txt p")
      cat_doc.search(".data_area_txt p").each do |p|
        description << p.text.strip
      end
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
    breed = cat_doc.search("tbody td")[0].nil? ? 'breed undefined' : cat_doc.search("tbody td")[0].text.strip
    gender = cat_doc.search("tbody td")[1].nil? ? 'gender undefined' : cat_doc.search("tbody td")[1].text.strip
    age = cat_doc.search("tbody td")[2].nil? ? 'age undefined' : cat_doc.search("tbody td")[2].text.strip
    description = []
    if cat_doc.search(".data_area_txt p")
      cat_doc.search(".data_area_txt p").each do |p|
        description << p.text.strip
      end
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
  location = cat_doc.search("tbody td")[2].nil? ? 'location undefined' : cat_doc.search("tbody td")[2].text.strip
  gender = cat_doc.search("tbody td")[3].nil? ? 'gender undefined' : cat_doc.search("tbody td")[3].text.strip
  age = cat_doc.search("tbody td")[4].nil? ? 'age undefined' : cat_doc.search("tbody td")[4].text.strip
  description = cat_doc.search("tbody td")[7].nil? ? '' : cat_doc.search("tbody td")[7].text.strip
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


def cat5
puts "Adding cats..."
  url = "http://www.arkbark.net/en/adopt/lifeline/catslifeline/"
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
    location = cat_doc.search("tbody td")[1].nil? ? 'location undefined' : cat_doc.search("tbody td")[1].text.strip
    gender = cat_doc.search("tbody td")[2].nil? ? 'gender undefined' : cat_doc.search("tbody td")[2].text.strip
    age = cat_doc.search("tbody td")[3].nil? ? 'age undefined' : cat_doc.search("tbody td")[3].text.strip
    description = cat_doc.search("tbody td")[4].nil? ? '' : cat_doc.search("tbody td")[4].text.strip
    pet = Pet.create(name: name, animal: animal, age: age, gender: gender, url: cat_url,
      description: description, location: location)
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

def cat6
  puts "Adding cats..."
  url = "https://www.zaidan-fukuoka-douai.or.jp/personal-animals/hogo/cat"
  sub_url = "https://www.zaidan-fukuoka-douai.or.jp"
  html = URI.open(url).read
  doc = Nokogiri::HTML(html, nil, "utf-8")

  doc.search(".animals-list ul li").each do |element|
    cat_url = element.search("a").first.attribute("href").value.strip
    cat_url = cat_url.gsub(" ", "%20") if cat_url.include?(" ")
    cat_html = URI.open("#{sub_url}#{cat_url}").read
    cat_doc = Nokogiri::HTML(cat_html, nil, "utf-8")

    name = cat_doc.search('.animals-type').first.text.strip
    animal = "cat"
    description = cat_doc.search("tbody tr")[1].search('td').nil? ? "" : cat_doc.search("tbody tr")[1].search("td").first.text.strip
    gender = cat_doc.search("tbody tr")[3].search('td').nil? ? 'gender undefined' : cat_doc.search("tbody tr")[3].search('td').text.strip
    age = cat_doc.search("tbody tr")[5].search('td').nil? ? 'gender undefined' : cat_doc.search("tbody tr")[5].search('td').text.strip
    pet = Pet.create(name: name, animal: animal, age: age, gender: gender, url: "#{sub_url}#{cat_url}", description: description)
    @all_pets << pet

    img_link = element.search("figure img").attribute("src").value.strip
    file1 = URI.open("#{sub_url}#{img_link}")
    pet.photo.attach(io: file1, filename: "cat#{@all_pets.index(@all_pets.last)}.jpeg", content_type: 'image/jpeg')
  end
  puts "Cats (fukuoka) added"
end

def cat7
  puts "Adding cats..."
  url = "https://www.zaidan-fukuoka-douai.or.jp/animals/centers/cat"
  sub_url = "https://www.zaidan-fukuoka-douai.or.jp"
  html = URI.open(url).read
  doc = Nokogiri::HTML(html, nil, "utf-8")

  doc.search(".animals-list ul li").each do |element|
    cat_url = element.search("a").first.attribute("href").value.strip
    cat_url = cat_url.gsub(" ", "%20") if cat_url.include?(" ")
    cat_html = URI.open("#{sub_url}#{cat_url}").read
    cat_doc = Nokogiri::HTML(cat_html, nil, "utf-8")

    name = cat_doc.search('.animals-type').first.text.strip
    animal = "cat"
    description = cat_doc.search("tbody tr")[1].search('td').nil? ? "" : cat_doc.search("tbody tr")[1].search("td").first.text.strip
    gender = cat_doc.search("tbody tr")[3].search('td').nil? ? 'gender undefined' : cat_doc.search("tbody tr")[3].search('td').text.strip
    age = cat_doc.search("tbody tr")[5].search('td').nil? ? 'gender undefined' : cat_doc.search("tbody tr")[5].search('td').text.strip
    pet = Pet.create(name: name, animal: animal, age: age, gender: gender, url: "#{sub_url}#{cat_url}", description: description)
    @all_pets << pet

    img_link = element.search("figure img").attribute("src").value.strip
    file1 = URI.open("#{sub_url}#{img_link}")
    pet.photo.attach(io: file1, filename: "cat#{@all_pets.index(@all_pets.last)}.jpeg", content_type: 'image/jpeg')
  end
  puts "Cats (fukuoka) added"
end

def others1
  puts "Adding rabbits..."
  url = "http://www.arkbark.net/en/adopt/othersosaka/"
  sub_url = "http://www.arkbark.net"
  html = URI.open(url)
  doc = Nokogiri::HTML(html, nil, "utf-8")
  doc.search("#animalList li").each do |element|
    rabbit_url = element.search("a").first.attribute("href").value.strip
    rabbit_url = rabbit_url.gsub(" ", "-") if rabbit_url.include?(" ")
    rabbit_html = URI.open(rabbit_url.to_s)
    rabbit_doc = Nokogiri::HTML(rabbit_html, nil, "utf-8")
    animal = 'rabbit'
    name = rabbit_doc.search('.tit').text.strip
    location = rabbit_doc.search("tbody td")[1].nil? ? 'location undefined' : rabbit_doc.search("tbody td")[1].text.strip
    gender = rabbit_doc.search("tbody td")[2].nil? ? 'gender undefined' : rabbit_doc.search("tbody td")[2].text.strip
    age = rabbit_doc.search("tbody td")[3].nil? ? 'age undefined' : rabbit_doc.search("tbody td")[3].text.strip
    description = rabbit_doc.search("tbody td")[4].nil? ? '' : rabbit_doc.search("tbody td")[4].text.strip
    pet = Pet.create(name: name, animal: animal, age: age, gender: gender, url: rabbit_url,
      location: location, description: description)
    @all_pets << pet
    img_link = element.search("img").first.attribute("src").value.strip
    encoded_img_link = []
    img_link.chars.each do |char|
      char = CGI.escape(char) if char != "/"
      encoded_img_link << char
    end
    img_url = sub_url + encoded_img_link.join

    file1 = URI.open(img_url)
    pet.photo.attach(io: file1, filename: "rabbit#{@all_pets.index(@all_pets.last)}.jpg", content_type: 'image/jpg')
  end
  puts "rabbits-like pets added"
end

def others2
  puts "Adding rabbits..."
  url = "http://www.arkbark.net/en/adopt/lifeline/otherslifeline/"
  sub_url = "http://www.arkbark.net"
  html = URI.open(url)
  doc = Nokogiri::HTML(html, nil, "utf-8")
  doc.search("#animalList li").each do |element|
    rabbit_url = element.search("a").first.attribute("href").value.strip
    rabbit_url = rabbit_url.gsub(" ", "-") if rabbit_url.include?(" ")
    rabbit_html = URI.open(rabbit_url.to_s)
    rabbit_doc = Nokogiri::HTML(rabbit_html, nil, "utf-8")
    animal = 'rabbit'
    name = rabbit_doc.search('.tit').text.strip
    location = rabbit_doc.search("tbody td")[1].nil? ? 'location undefined' : rabbit_doc.search("tbody td")[1].text.strip
    gender = rabbit_doc.search("tbody td")[2].nil? ? 'gender undefined' : rabbit_doc.search("tbody td")[2].text.strip
    age = rabbit_doc.search("tbody td")[3].nil? ? 'age undefined' : rabbit_doc.search("tbody td")[3].text.strip
    description = rabbit_doc.search("tbody td")[4].nil? ? '' : rabbit_doc.search("tbody td")[4].text.strip
    pet = Pet.create(name: name, animal: animal, age: age, gender: gender, url: rabbit_url,
      location: location, description: description)
    @all_pets << pet
    img_link = element.search("img").first.attribute("src").value.strip
    encoded_img_link = []
    img_link.chars.each do |char|
      char = CGI.escape(char) if char != "/"
      encoded_img_link << char
    end
    img_url = sub_url + encoded_img_link.join

    file1 = URI.open(img_url)
    pet.photo.attach(io: file1, filename: "rabbit#{@all_pets.index(@all_pets.last)}.jpg", content_type: 'image/jpg')
  end
  puts "rabbits-like pets added"
end

dog1
dog2
dog3
dog4
dog5
dog6
dog7
dog8
cat1
cat2
cat3
cat4
cat5
cat6
cat7
others1
others2


puts "Database seeded... #{Pet.count} pets added!"
