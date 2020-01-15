class CreateFish < ActiveRecord::Migration[6.0]
  def change
    create_table :fish do |t|
      t.string :name
      t.string :scientific_name
      t.string :biology
      t.string :location
      t.string :image
      t.string :population
      t.string :harvest
      t.string :harvest_type
      t.string :best_harvest
      t.string :farming_methods
      t.string :fishing_rate
      t.string :availability
      t.string :health_benefits
      
      t.timestamps
    end
  end
end
