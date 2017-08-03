class AddTimeLabelToMoisture < ActiveRecord::Migration[5.1]
  def change
    add_column :moistures, :time_label, :datetime
  end
end
