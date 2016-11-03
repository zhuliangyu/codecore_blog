class Post < ApplicationRecord
  validates :title, presence: true, uniqueness:true

  belongs_to :category

  has_many :comments, dependent: :destroy

  belongs_to :user

  has_attached_file :image, styles: { small: "64x64", med: "100x100", large: "200x200" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/



end
