require 'cpf_cnpj'

class Paciente < ApplicationRecord
  has_one :endereco, dependent: :destroy
  accepts_nested_attributes_for :endereco, allow_destroy: true

  has_many :consultums, dependent: :destroy
  has_many :medicos, through: :consultums

  validate :dataNasc_valida
  validates :cpf, uniqueness: true
  validate :cpf_valida
  validates :email, presence: true, uniqueness: true, format:  { with: URI::MailTo::EMAIL_REGEXP }
  validates :nome, presence: true, length: {in: 3..30}, format: {with: /\A[a-zA-Z]+\z/, message: "Use apenas letras"}


  def dataNasc_valida
    if dataNasc.present? && dataNasc > Date.today
      errors.add(:data, "de nascimento não pode ser uma data futura")
    end
  end

  def cpf_valida
    if cpf.present? && !CPF.valid?(cpf)
      errors.add(:cpf, "Formato: XXX.XXX.XXX-XX")
    end
  end
end
