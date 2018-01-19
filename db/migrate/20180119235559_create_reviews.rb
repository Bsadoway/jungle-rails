class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :product_id
      t.references :user, index: true, foreign_key: true
      t.text :description
      t.integer :rating

      t.timestamps null: false
    end
  end
end
