class Comment < ApplicationRecord
  validates :body, presence: true, uniqueness: {scope: :post}
end
