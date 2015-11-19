class CreateParshas < ActiveRecord::Migration
  def change
    create_table :parshas do |t|
      t.string :name
      t.boolean :available, :default => true
      t.integer :people_id
      t.integer :past_id
      t.integer :sefer_id
      t.date :date

      t.timestamps null: true
    end
  end
end
