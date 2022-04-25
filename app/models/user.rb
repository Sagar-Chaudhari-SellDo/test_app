class User
  include Mongoid::Document
  include ActiveModel::SecurePassword
  field :email, type: String
  validates :email, presence: true , uniqueness: true   
  field :password_digest, type: String
  has_secure_password
end
