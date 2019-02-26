class User < ApplicationRecord
  has_secure_password

  has_many :wines

  validates :username, presence: true
  validates :email, presence: true, uniqueness: true
  validates_format_of :email, :with => /\A[^@,\s]+@[^@,\s]+\.[^@,\s]+\z/
  validates :password, presence: true, length: {minimum: 6}

end
