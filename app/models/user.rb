class User < ApplicationRecord
    has_many :microposts
    before_save { self.email = email.downcase}
    validates :name, presence: true, length: { maximum:50 }
    validates :email, presence: true, length: { maximum:255 }, uniqueness: true,
        format: { with: /\A[\wа-яА-я+\-.]+@[a-z\d\-.]+[\.]{1}[a-zа-я]+\z/i }
    validates :password, presence: true, length: { minimum:6 }
    has_secure_password
end
