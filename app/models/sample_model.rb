require 'httparty'
require 'json'
require 'pp'

def get_recipes(ingredients, query)
    
    url = "http://www.recipepuppy.com/api/?i=#{ingredients}&q=#{query}"
    
    response = HTTParty.get(url)
    recipe_data = JSON.parse(response.body, {:symbolize_names => true})
    recipe_array = recipe_data[:results]
    
    results = []
    recipe_array.each do |recipe|
        results.push(recipe[:title].gsub("\n", ""))
    end 
    
    return results
end