class Register < ApplicationRecord
  belongs_to :user
  belongs_to :day

  #one user to one register (duplicates)
  validates_uniqueness_of :user_id, :scope => :day_id
end
