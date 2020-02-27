class AddCoordinatesToBicycles < ActiveRecord::Migration[6.0]
  def change
    add_column :bicycles, :latitude, :float
    add_column :bicycles, :longitude, :float
  end
end
