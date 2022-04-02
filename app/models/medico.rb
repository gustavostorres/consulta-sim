require 'cpf_cnpj'

class Medico < ApplicationRecord
  has_many :consultums, dependent: :destroy
  has_many :pacientes, through: :consultums

  validate :cpf_valida
  validates :email, presence: true, uniqueness: true, format:  { with: URI::MailTo::EMAIL_REGEXP }
  validates :especialidade, presence: true, length: {in:3..30}, format: {with: /\A[a-zA-Z ]+\z/, message: "Use apenas letras"}
  validates_format_of :crm, with: /\A\d{8}-\d{1}\z/, presence: true,
                      message: 'formato: XXXXXXXX-X'
  validates :nome, presence: true, length: {in: 3..30}, format: {with: /\A[a-zA-Z ]+\z/, message: "Use apenas letras"}

  def cpf_valida
    if cpf.present? && !CPF.valid?(cpf)
      errors.add(:cpf, "Formato: XXX.XXX.XXX-XX")
    end
  end
end
