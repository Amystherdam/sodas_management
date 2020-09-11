class CreateSodas < ActiveRecord::Migration[5.2]
  def change
    create_table :sodas do |t|
      t.string :brand
      t.string :category
      t.string :flavor
      t.integer :capacity
      t.float :price
      t.integer :quantiti

      t.timestamps
    end
  end
end
