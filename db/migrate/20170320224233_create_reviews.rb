class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.references :user, index: true, foreign_key: true
      t.references :product, index: true, foreign_key: true
      t.integer :star
      t.string :comment

      t.timestamps null: false
    end
  end
end
