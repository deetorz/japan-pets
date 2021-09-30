class PetsController < ApplicationController
  require "uri"
  require "open-uri"
  require "nokogiri"

  def index
    @pets = Pet.all
  end

  def show
  end
@all_pets =[]

  url = "http://www.arkbark.net/en/adopt/catsosaka/"
  sub_url = "http://www.arkbark.net"
  html = URI.open(url)
  doc = Nokogiri::HTML(html, nil, "utf-8")
  doc.search("#animalList li").each do |element|
    cat_url = element.search("a").first.attribute("href").value.strip
    cat_url = cat_url.gsub(" ", "-") if cat_url.include?(" ")
    cat_html = URI.open("#{cat_url}")
    cat_doc = Nokogiri::HTML(cat_html, nil, "utf-8")
    animal = 'cat'
    name = cat_doc.search('.tit').text.strip
    location = cat_doc.search("tbody td")[2].text.strip
    gender = cat_doc.search("tbody td")[3].text.strip
    age = cat_doc.search("tbody td")[4].text.strip
    description = cat_doc.search("tbody td")[7].text.strip
    pet = Pet.create(name: name, animal: animal, age: age, gender: gender, url: cat_url, description: description, location: location)
    @all_pets << pet
    img_link = element.search("img").first.attribute("src").value.strip

    begin
      uri = URI.parse("http://www.arkbark.net#{img_link}")
    rescue URI::InvalidURIError
      uri = URI.parse(URI.escape("http://www.arkbark.net#{img_link}")).to_s
    end

    # file1 = URI.open("http://www.arkbark.net#{img_link}")#returns japanese charachers
    pet.photo.attach(io: uri.read.base_uri, filename: "cat#{@all_pets.index(@all_pets.last)}.jpg", content_type: 'image/jpg')
  end
end
