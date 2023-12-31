class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :users_ocrs,       dependent: :destroy
  has_many :user_income,      dependent: :destroy
  has_many :user_expenditure, dependent: :destroy
  
  
  
  
end
