class AddDetailsToSodas < ActiveRecord::Migration[5.2]
  def change
    change_column :sodas, :price, :decimal, precision: 6, scale: 2
  end
end
