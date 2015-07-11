class Specialization < ActiveRecord::Base

  #---Associations -----------------------------------------------
  has_and_belongs_to_many :merchants

  #---Validations-------------------------------------------------
  validates :name, presence: true, uniqueness: true

end
