class CreatePasts < ActiveRecord::Migration
  def change
    create_table :pasts do |t|
      t.integer :people_id
      t.integer :parsha_id
      t.integer :times_read

      t.timestamps null: true
    end
  end
end
