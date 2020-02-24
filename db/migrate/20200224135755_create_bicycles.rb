class CreateBicycles < ActiveRecord::Migration[6.0]
  def change
    create_table :bicycles do |t|
      t.string :location
      t.string :style
      t.integer :price
      t.string :size
      t.string :title

      t.timestamps
    end
  end
end
