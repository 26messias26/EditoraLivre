class Publication < ApplicationRecord
  belongs_to :user

  has_many :colaboradores
  has_many :colaboradores_users, through: :colaboradores, source: :user
end
