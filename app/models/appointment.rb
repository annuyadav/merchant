class Appointment < ActiveRecord::Base

  #---Associations -----------------------------------------------
  belongs_to :merchant

  #---Validations ------------------------------------------------
  validates :start_time, :end_time, :merchant, presence: true

end
