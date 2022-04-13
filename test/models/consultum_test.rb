require "test_helper"

class ConsultumTest < ActiveSupport::TestCase
  test 'Criando consulta sem preencher os dados' do
    consulta = Consultum.new
    assert_not consulta.save
  end

  test 'Criando consulta com dados validos' do
    paciente = Paciente.new nome: 'Gustavo Torres', dataNasc: DateTime.now,
                            cpf: '027.760.354-46', email: 'dika_ka@hotmail.com'
    assert paciente.save
    medico = Medico.new nome: 'Gustavo Torres', cpf: '027.760.354-46', email: 'dika_ka@hotmail.com',
                        especialidade: 'Ortopedista', crm: '12345678-9'
    assert medico.save
    consulta = Consultum.new data: DateTime.now, horario: '10:00', paciente_id: paciente.id, medico_id: medico.id
    assert consulta.save
  end

  test 'Criando consulta com dados de medico invalido' do
    paciente = Paciente.new nome: 'Gustavo Torres', dataNasc: DateTime.now,
                            cpf: '027.760.354-46', email: 'dika_ka@hotmail.com'
    assert paciente.save
    medico = Medico.new nome: 'Gustavo Torres', cpf: '027.760.354-46', email: 'dika_ka@hotmail.com',
                        especialidade: 'Ortopedista', crm: '12345678-9'
    assert medico.save
    consulta = Consultum.new data: DateTime.now, horario: '10:00', paciente_id: paciente.id, medico_id: medico.nome
    assert_not consulta.save
  end

  test 'Criando consulta com dados de paciente invalido' do
    paciente = Paciente.new nome: 'Gustavo Torres', dataNasc: DateTime.now,
                            cpf: '027.760.354-46', email: 'dika_ka@hotmail.com'
    assert paciente.save
    medico = Medico.new nome: 'Gustavo Torres', cpf: '027.760.354-46', email: 'dika_ka@hotmail.com',
                        especialidade: 'Ortopedista', crm: '12345678-9'
    assert medico.save
    consulta = Consultum.new data: DateTime.now, horario: '10:00', paciente_id: paciente.nome, medico_id: medico.id
    assert_not consulta.save
  end
  # test "the truth" do
  #   assert true
  # end
end
