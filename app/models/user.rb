class User < ActiveRecord::Base
  has_many :orders, dependent: :destroy
  validates :login, presence: true
end
