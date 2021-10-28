class CreatePatients < ActiveRecord::Migration[5.2]
  def change
    create_table :patients do |t|
      t.string :first_name
      t.string :last_name
      t.string :city 
      #add_reference :patients, :city, foreign_key: true

      t.timestamps
    end
  end
end




