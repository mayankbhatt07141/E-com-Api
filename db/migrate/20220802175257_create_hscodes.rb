class CreateHscodes < ActiveRecord::Migration[7.0]
  def change
    create_table :hscodes do |t|
      t.integer :code
      t.timestamps
    end
  end
end
