require_relative '../data_mapper_setup'
require 'bcrypt'
require "dm-validations"

class User

  include DataMapper::Resource


  property :id, Serial
  property :email, String
  property :user_password, Text
  attr_accessor :password_confirmation
  attr_reader :password

  validates_confirmation_of :password

  def password=(new_password)
    @password = new_password
    self.user_password = BCrypt::Password.create(new_password)
  end

end