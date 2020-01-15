class AddRegionToFish < ActiveRecord::Migration[6.0]
  def change
    add_column :fish, :region, :string
  end
end
