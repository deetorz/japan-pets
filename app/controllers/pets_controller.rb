class PetsController < ApplicationController
  def index
    search#('cat')
    @pets = Pet.all
  end

  def show
  end

  private

  def search#(keyword)
    cat_url1#(keyword)
  end

  def cat_url1
    html = URI.open("https://japancatnetwork.org/").read
    doc = Nokogiri::HTML(html, nil, "utf-8")

    doc.search(".img_portfolio").all.each do |element|
      unless element.search('h3 a').first.text.strip.include?("ADOPTED")
        name = element.search('h3 a').first.text.strip
        animal = "cat"
        cat_url = element.search(".img_portfolio a").first.attribute("href").value.strip
        cat_html = URI.open(cat_url).read
        cat_doc = Nokogiri::HTML(cat_html, nil, "utf-8")
        gender = cat_doc.search("th").first.text.strip
        description = cat_doc.search("th p").first.text.strip
        Pet.new(name: name, animal: animal, gender: gender, description: description)
      end
    end
  end
end
