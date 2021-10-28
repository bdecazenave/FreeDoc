class Removereferencesfromcity < ActiveRecord::Migration[5.2]
  def change
   remove_reference(:cities, :doctor, index: false)
   remove_reference(:cities, :patient, index: false)
   remove_reference(:cities, :appointment, index: false)
  end
end
