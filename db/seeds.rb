# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

data_file = File.read(Rails.root.join('db', 'datasets', 'Gustavosta_Stable-Diffusion-Prompts.json'))
parsed_data = JSON.parse(data_file)['Prompt']

buffer = []
parsed_data.each do |prompt|
  buffer << { body: prompt }
end

Prompt.insert_all buffer

Prompt.reindex

