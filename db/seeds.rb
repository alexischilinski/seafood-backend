# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'pry'

require 'rest-client'

User.destroy_all
Fish.destroy_all
Region.destroy_all



def fish_list
    response = RestClient.get("https://www.fishwatch.gov/api/species")
    result = JSON.parse(response)
    array = []
    region = nil

    result.map do |fish|
        Fish.create(name: fish["Species Name"], 
        scientific_name: fish["Scientific Name"],
        biology: fish["Biology"],
        location: fish["Location"],
        image: fish["Species Illustration Photo"]["src"],
        population: fish["Population"],
        harvest: fish["Harvest"],
        harvest_type: fish["Harvest Type"],
        best_harvest: fish["Quote"],
        farming_methods: fish["Farming Methods"],
        fishing_rate: fish["Fishing Rate"],
        availability: fish["Availability"],
        health_benefits: fish["Health Benefits"],
        region: fish["NOAA Fisheries Region"]
        )
    end

    result.map do |fish|
        region = fish["NOAA Fisheries Region"]
            if region.include?(', ')
                new_region = region.split(', ')
                new_region.map do |region|
                    array << region
                end
            else array << region
        end
    end
    regions_array = array.uniq
    regions_array.map do |region|
        Region.create(name: region)
    end
end

fish_list

def region_list
    response = RestClient.get("https://www.fishwatch.gov/api/species")
    result = JSON.parse(response)
    array = []

    result.map do |fish|
        region = fish["NOAA Fisheries Region"]
            if region.include?(', ')
                new_region = region.split(', ')
                new_region.map do |region|
                    array << region
                end
            else array << region
        end
    end
    regions_array = array.uniq
    regions_array.map do |region|
        Region.create(name: region)
    end
end