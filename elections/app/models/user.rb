class User < ActiveRecord::Base
  attr_accessible :admin, :crypted_password, :email, :login, :persistence_token
  attr_protected :admin
  acts_as_authentic do |config|
    config.crypted_password_field = :crypted_password
    config.require_password_confirmation = true
  end
  has_one :role
  has_and_belongs_to_one :constituency

  def admin?
   self.role.name =="admin"
  end
  def centralny?
    self.role.name =="centralny"
  end
  def okregowy?
    self.role.name == "okregowy"
  end
end
