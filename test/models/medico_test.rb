require "test_helper"

class MedicoTest < ActiveSupport::TestCase
  test 'Criando medico com dados validos' do
    medico = Medico.new nome: 'Gustavo Torres', cpf: '027.760.354-46', email: 'dika_ka@hotmail.com',
                        especialidade: 'Ortopedista', crm: '12345678-9'
    assert medico.save
  end

  test 'Criando medico com crm invalido' do
    medico = Medico.new nome: 'Gustavo Torres', cpf: '027.760.354-46', email: 'dika_ka@hotmail.com',
                        especialidade: 'Ortopedista', crm: '123436'
    assert_not medico.save
  end

  test 'Criando medico sem preencher os dados' do
    medico = Medico.new
    assert_not medico.save
  end

  test 'Garantido unicidade de dados na criacao de um medico' do
    medico = Medico.new nome: 'Gustavo Torres', cpf: '027.760.354-46', email: 'dika_ka@hotmail.com',
                        especialidade: 'Ortopedista', crm: '12345678-9'
    assert medico.save
    medico = Medico.new nome: 'Gustavo Torres', cpf: '027.760.354-46', email: 'dika_ka@hotmail.com',
                        especialidade: 'Ortopedista', crm: '12345678-9'
    assert_not medico.save
  end

  # test "the truth" do
  #   assert true
  # end
end
