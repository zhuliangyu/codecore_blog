class Post < ApplicationRecord
  validates :title, presence: true, uniqueness:true

  belongs_to :category

  has_many :comments

end
