require "open-uri"

Horse.destroy_all
Breed.destroy_all
AdminUser.destroy_all

NUMBER_OF_BREEDS = 5
HORSES_PER_BREED = 15

image_client = Pexels::Client.new()
response = image_client.photos.search('horse', page: 1, per_page: 100)

NUMBER_OF_BREEDS.times do
  breed = Breed.create(name: Faker::Creature::Horse.unique.breed)

  HORSES_PER_BREED.times do
    breed.horses.create(
      name: Faker::Creature::Horse.unique.name,
      age: rand(1..587).to_i,
      number_of_legs: rand(2..222).to_i,
      top_speed: 15 + rand * 100
    )
  end
end

Horse.all.each_with_index do |horse, index|
  downloaded_image = URI.parse(response.photos[index].src["small"]).open
  horse.image.attach(io: downloaded_image, filename: "#{horse.name} - #{horse.breed.name}.jpg")
end

puts "Created #{Breed.count} Breeds."
puts "Created #{Horse.count} Horses."
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
