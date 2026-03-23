require 'net/http'
require 'json'

url = URI("https://data.winnipeg.ca/resource/4her-3th5.json?$limit=200")
response = Net::HTTP.get(url)
data = JSON.parse(response)

data.each do |item|
  category_name = item["service_area"] || "Other"

  category = Category.find_or_create_by(name: category_name)

  Request.create(
    title: item["service_request"] || "Request",
    description: item["neighbourhood"] || "No description",
    status: "Open", # since no status in API
    category: category
  )
end

puts "Data loaded!"