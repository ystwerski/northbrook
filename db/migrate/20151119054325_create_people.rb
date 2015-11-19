class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :first_name
      t.string :last_name
      t.date :birthday
      t.string :email
      t.string :password
      t.string :phone
      t.string :address
      t.string :city
      t.string :state
      t.integer :past_id
      t.text :notes

      t.timestamps null: true
    end
  end
end
