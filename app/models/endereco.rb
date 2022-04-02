class Endereco < ApplicationRecord
  belongs_to :paciente

  validates_format_of :cep, with: /\A\d{5}-\d{3}\z/, presence: true,
                      message: 'formato: XXXXX-XXX'
  validates :cidade, presence: true, length: {in: 3..30}, format: {with: /\A[a-zA-Z ]+\z/,
                                                                   message: "Use apenas letras"}
  validates :bairro, presence: true, length: {in: 3..30}, format: {with: /\A[a-zA-Z ]+\z/,
                                                                   message: "Use apenas letras"}
  validates :logradouro, presence: true, length: {in: 3..30}, format: {with: /\A[a-zA-Z ]+\z/,
                                                                       message: "Use apenas letras"}
  validates :complemento, presence: true, length: {in: 1..10}, format: {with:/\A[a-zA-Z0-9\s]+\z/i,
                                                                        message: "Use apenas letras e números"}
end
