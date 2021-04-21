class CreateCoffeeSales < ActiveRecord::Migration[5.2]
  def change
    create_table :coffee_sales do |t|
      t.string :origin
      t.string :blend
      t.integer :price
      t.date :date

      t.timestamps
    end
  end
end
