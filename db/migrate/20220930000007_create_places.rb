class CreatePlaces < ActiveRecord::Migration[7.0]
  def change
    create_table :places do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :country
      t.integer :price
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
