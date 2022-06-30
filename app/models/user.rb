class User < ApplicationRecord
include ActiveModel::SecurePassword
  has_secure_password :recovery_password, validations: false

  attr_accessor :password_digest, :recovery_password_digest
end
