class CreateUserFishes < ActiveRecord::Migration[6.0]
  def change
    create_table :user_fishes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :fish, null: false, foreign_key: true

      t.timestamps
    end
  end
end
