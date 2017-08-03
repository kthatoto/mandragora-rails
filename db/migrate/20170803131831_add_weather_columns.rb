class AddWeatherColumns < ActiveRecord::Migration[5.1]
  def change
    add_column :weathers, :weather, :string
    add_column :weathers, :temperature, :float
    add_column :weathers, :humidity, :integer
    add_column :weathers, :time_label, :datetime
  end
end
