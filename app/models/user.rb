class User < ApplicationRecord
  has_secure_password

  belongs_to :region, dependent: :destroy
  has_many :user_fishes
  has_many :fishes, through: :user_fishes
end
