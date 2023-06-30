# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
url = "https://gist.githubusercontent.com/ssaunier/be9a933b64116e2422176aab7528473e/raw/d1e1b06e25616771fddf44bf066765f518b0655d/imdb.yml"
sample = YAML.load(URI.parse(url).read)

puts "Creating directors..."
directors = {} # slug => Director
sample["directors"].each do |director|
  directors[director["slug"]] = Director.create!(director.slice("first_name", "last_name"))
end

puts "Creating movies..."
sample["movies"].each do |movie|
  Movie.create!(movie.slice("title", "year", "synopsis").merge(director: directors[movie["director_slug"]]))
end

puts "Creating TV shows..."
sample["tv_shows"].each { |tv_show| TvShow.create!(tv_show) }
puts "Done."
