class NewSerializer < ActiveModel::Serializer
  belongs_to :user
  attributes :id, :title, :content, :user_id
end
