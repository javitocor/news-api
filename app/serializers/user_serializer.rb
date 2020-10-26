class USerSerializer < ActiveModel::Serializer
  has_many :news
  attributes :id, :email, :password, :admin
end
