class User < ApplicationRecord
  # Include default devise modules. Others available are:
  #  :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :trackable

  validates :nome, presence: true
  
  has_many :publications

  has_many :amigos
  has_many :amigos_users, through: :amigos, source: :amigo

  has_many :colaboradores
  has_many :colaboradores_publications, through: :colaboradores, source: :publication
end
