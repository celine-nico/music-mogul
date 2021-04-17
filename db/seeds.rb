User.destroy_all 
Song.destroy_all 


5.times do
    User.create(name: Faker::Games::ElderScrolls.name, 
    username: Faker::Games::ElderScrolls.first_name,
    hometown: Faker::Address.city)
end 

genre = ["Pop","R&B","EDM","Rap","Alternative"]

10.times do 
    Song.create(name: Faker::Music::Prince.song , artist: Faker::Name.name, genre: genre.sample)
end 


puts "You got great taste! Keep it going!"