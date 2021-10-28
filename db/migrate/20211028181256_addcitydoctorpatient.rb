class Addcitydoctorpatient < ActiveRecord::Migration[5.2]
  def change
    add_reference(:patients, :city, index: true)
    add_reference(:doctors, :city, index: true)
  end
end
