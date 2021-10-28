class CreateDoctors < ActiveRecord::Migration[5.2]
  def change
    create_table :doctors do |t|
      t.string :first_name
      t.string :last_name
      t.string :zip_code
      t.string :city
      
      #add_reference :doctors, :city, foreign_key: true

      t.timestamps
    end
  end
end
