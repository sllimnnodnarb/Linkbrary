1.times do
  user = User.create!(
    email: Faker::Internet.email,
    password: Faker::Internet.password(8),
    role: 'member'
  )
  user.update_attributes!(confirmed_at: Time.now)
end
users = User.all

2.times do
  Shelf.create!(
    title: Faker::Book.genre,
    user: users.sample
  )
end
shelves = Shelf.all

5.times do
  bookmark = Bookmark.create!(
    shelf: Shelf.all.sample,
    url: Faker::Internet.domain_name
  )
  bookmark.update_attributes!(created_at: 10.days.ago)
end
bookmarks = Bookmark.all


puts "#{User.count} users created"
puts "#{Bookmark.count} bookmarks created"
puts "#{Shelf.count} shelves created"
puts "Seed finished"
puts "Some seeds fell beside the road, and the birds came and ate them up..."
