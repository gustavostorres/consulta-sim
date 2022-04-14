require "test_helper"

class PacienteTest < ActiveSupport::TestCase
  test 'Criando paciente com dados validos' do
    paciente = Paciente.new nome: 'Gustavo Torres', dataNasc: DateTime.now,
                            cpf: '027.760.354-46', email: 'dika_ka@hotmail.com'
    assert paciente.save
  end

  test 'Criand paciente com cpf invalido' do
    paciente = Paciente.new nome: 'Gustavo Torres', dataNasc: DateTime.now,
                            cpf: '708.280.934-a', email: 'torresbcc@outlook.com'
    assert_not paciente.save
  end

  test 'Criando paciente com endereco' do
    paciente = Paciente.new nome: 'Gustavo Torres', dataNasc: DateTime.now,
                            cpf: '027.760.354-46', email: 'dika_ka@hotmail.com'
    endereco = Endereco.new cep: '55292-826', cidade: 'Garanhuns', bairro: 'Boa Vista',
                            logradouro: 'Laurindo de Souza', complemento: '705'
    endereco.paciente = paciente.id
    assert paciente.save
  end

  test 'Criando paciente sem preencher os dados' do
    paciente = Paciente.new
    assert_not paciente.save
  end

  test 'Garantido unicidade nos dados de paciente' do
    paciente = Paciente.new nome: 'Gustavo Torres', dataNasc: DateTime.now,
                            cpf: '027.760.354-46', email: 'dika_ka@hotmail.com'
    assert paciente.save
    paciente = Paciente.new nome: 'Gustavo Torres', dataNasc: DateTime.now,
                            cpf: '027.760.354-46', email: 'dika_ka@hotmail.com'
    assert_not paciente.save
  end

  # test "the truth" do
  #   assert true
  # end
end
