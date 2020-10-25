class New < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, allow_blank: false, length: {minimum: 4, maximum: 25}
  validates :content, presence: true, allow_blank: false, length: {minimum: 25}
end
