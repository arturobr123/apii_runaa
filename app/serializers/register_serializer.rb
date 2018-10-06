class RegisterSerializer < ActiveModel::Serializer
  attributes :id, :entry, :exit
  has_one :user
  has_one :day
end
