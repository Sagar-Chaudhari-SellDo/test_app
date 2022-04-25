class Current 
  include Mongoid::Document
  include ActiveModel::SecurePassword
  attr_accessor :user
end