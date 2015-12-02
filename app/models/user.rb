# just the user validations
class User < ActiveRecord::Base
  before_save { self.email =  email.downcase }
  validates :name, presence: true,
                   length: { maximum: 100 }
  validates :email, presence: true,
                    length: { maximum: 255 },
                    format: { with:
                                /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i },
                    uniqueness: { case_sensitive: false }
end
