class CreateMoistures < ActiveRecord::Migration[5.1]
  def change
    create_table :moistures do |t|

      t.timestamps
    end
  end
end
