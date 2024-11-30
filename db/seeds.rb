# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


# Seed file code in Ruby

require 'openai'

client = OpenAI::Client.new(access_token: ENV['OPENAI_ACCESS_TOKEN'])

verbs = ["gehen", "finden", "bleiben", "essen"] # Replace with your list of verbs

prompt = <<~PROMPT
  Return only an array of hashes for the following German verbs. Each hash should contain:
  - slug: the verb in its infinitive form (e.g., "gehen").
  - front: the verb in the format "infinitive (3rd person singular present tense) - English translation".
  - back: the Präteritum and Perfekt forms in the format "Präteritum | Perfekt".
  Use the following verb as an example:
  gehen: { slug: "gehen", front: "gehen (geht) - to go", back: "ging | ist gegangen" }
  Only provide the array of hashes as the response. Do not include any other text.
  Process the following list of verbs: #{verbs.join(', ')}.
PROMPT


response = client.chat(
  parameters: {
    model: "gpt-4o-mini",
    messages: [{ role: "user", content: prompt}],
    max_tokens: 500
  }
)

response = response["choices"][0]["message"]["content"]
# parse response into array of hashes
response = response.split("\n").map do |line|
  
end

puts response["choices"].first["text"]
