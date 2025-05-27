class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # associations
  has_many :books
  has_many :requests
  has_many :reviews

  # validations
  validates :full_name, presence: true
  validates :address, presence: true
  validates_associated :books
  validates_associated :requests
  validates_associated :reviews
  
end
