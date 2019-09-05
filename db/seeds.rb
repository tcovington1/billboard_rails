# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
@billboards = ['billboard', 'us', 'international']
@num = [1..10]

3.times do
  billboard = Billboard.create(
    billboard_name: @billboards.sample,
    rank: @num.sample
    )
    4.times do 
      artist = Artist.create(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        age: Faker::Number.within(range: 1..100)
      )
  10.times do
    song = Song.create(
      title: Faker::Verb.past,
      top: Faker::Boolean.boolean,
      billboard_id: billboard.id,
      artist_id: artist.id
      )
      
      end 
  end
end

puts 'Data seeded.'