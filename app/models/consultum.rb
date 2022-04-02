class Consultum < ApplicationRecord
  belongs_to :paciente
  belongs_to :medico

  validate consulta_valida
  
  def consulta_valida
    if data.present? && data < Date.today
      errors.add(:data, "invalida, não se pode agendar uma consulta nesse dia")
    end
  end
end
