class User < ApplicationRecord
    has_many :recipes
    has_many :user_allergies
    has_many :ingredients, through: :user_allergies
    validates :name, :email, :occupation, :experience, presence: true
    validates :email, uniqueness: true
    validates :experience, numericality: true
end
