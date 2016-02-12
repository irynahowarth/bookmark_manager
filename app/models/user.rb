require_relative '../data_mapper_setup'
require 'bcrypt'

class User
  include DataMapper::Resource

  property :id, Serial
  property :email, String
  property :user_password, Text

  def password=(new_password)
    self.user_password = BCrypt::Password.create(new_password)
  end

end