class ChangingColumnName < ActiveRecord::Migration
  def change
  	rename_column :parshas, :people_id, :person_id
  end
end
