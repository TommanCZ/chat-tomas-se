class User < ApplicationRecord
  has_many :messages
  before_save :hash_passwords

  validates :username, presence: true, uniqueness: true
  validates :passhash, presence: true

  def hash_passwords
    self.salt = SecureRandom.hex(32)
    self.passhash = Digest::SHA256.hexdigest("#{passhash}#{salt}")
  end
end
