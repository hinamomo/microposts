class User < ActiveRecord::Base
  before_save { self.email = self.email.downcase }
  validates :name, presence: true, length: { maximum:50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/in
  validates :email, presence: true, length: { maximum:255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
                    
  VALID_BIRTHDAY_REGEX = /\A\d{4}\/\d{2}\/\d{2}\z/ 
  validates :birthday, format: { with: VALID_BIRTHDAY_REGEX}, allow_blank: false

  has_secure_password
end
