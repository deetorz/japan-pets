# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


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
        pet = Pet.create(name: name, animal: animal, gender: gender)
        img_link = element.search("a img").attribute("srcset").value.first.strip
        file1 = URI.open("#{url}#{img_link}")
        pet.photo.attach(io: file1, filename: "cat.jpeg")
      end
    end
  end

cat_url1#(keyword)
