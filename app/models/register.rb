class Register < ApplicationRecord
  belongs_to :user
  belongs_to :day

  validates_uniqueness_of :user_id, :scope => :day_id
end
