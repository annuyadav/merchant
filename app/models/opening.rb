class Opening < ActiveRecord::Base

  #---Constant ---------------------------------------------------
  STATUS = {0 => 'booked', 1 => 'available', 2 => 'complete'}

  #---Associations -----------------------------------------------
  belongs_to :merchant

  #---Validations ------------------------------------------------
  validates :merchant, :start_time, :end_time, presence: true
  validates :status, presence: true, inclusion: {in: STATUS.keys}

  #---Scopes------------------------------------------------------
  default_scope -> { where('start_time > ? AND status = ?', Time.now.midnight, 1) }

end
