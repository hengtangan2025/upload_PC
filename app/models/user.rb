class User
  include Mongoid::Document
  include ActiveModel::SecurePassword
  field :account_number, type: String
  field :name, type: String
  field :password, type: String
  field :password_digest, type: String
  validates :account_number, uniqueness: true, presence: true
  validates :name, uniqueness: true, presence: true

  has_many :informations

  has_secure_password
end