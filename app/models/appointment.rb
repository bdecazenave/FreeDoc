class Appointment < ApplicationRecord
  belongs_to :patient
  belongs_to :city
  belongs_to :doctor

end