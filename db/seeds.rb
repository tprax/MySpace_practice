100.times do
  Post.create(post: Faker::ChuckNorris.fact)
end