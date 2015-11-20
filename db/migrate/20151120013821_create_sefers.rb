class CreateSefers < ActiveRecord::Migration
  def change
    create_table :sefers do |t|
      t.string :name
      t.timestamps null: true
    end
  end
end
