class Day < ApplicationRecord
  has_many :registers, dependent: :destroy
end
