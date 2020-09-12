class AddUniqueIndexToSodas < ActiveRecord::Migration[5.2]
  def change
    add_index :sodas, [:brand, :capacity], unique: true
  end
end
