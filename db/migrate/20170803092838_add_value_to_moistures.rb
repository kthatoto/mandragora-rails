class AddValueToMoistures < ActiveRecord::Migration[5.1]
  def change
    add_column :moistures, :value, :integer
  end
end
