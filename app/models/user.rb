class User < ApplicationRecord
  has_many :posts,dependent: :nullify
  has_many :comments,dependent: :nullify
  validates :email, uniqueness: true
  validates :first_name,presence: true,on: :create
  validates :last_name,presence: true,on: :create

  # validates :password,presence: true


  has_secure_password

  validates :password, presence: true, on: :create


end
