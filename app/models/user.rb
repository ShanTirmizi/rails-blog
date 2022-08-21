class User < ApplicationRecord
  validates :username, presence: true, Length: { minimum: 3, maximum: 25 }, uniqueness: { case_sensitive: false }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence: true, Length: { maximum: 105 },  uniqueness: { case_sensitive: false }, format: { with: VALID_EMAIL_REGEX}
end