Feature:
  As a paciente
  I want to criar, editar, remover e visualizar meu cadastro
  So that possa manter atualizado meu cadastro

  Scenario: cadastrar paciente
    Given Estou na pagina de cadastrar paciente
    When eu preencho os dados nome 'Torres' dataNasc '2000-11-14' cpf '027.760.354-46' email 'liricustorres@gmail.com' logradouro 'Euclides Laurindo de Souza'  complemento '705' cep '55292-818'  bairro 'Boa vista' cidade 'Garanhuns'
    Then vejo que o meu cadastro 'Torres' foi efetuado


  Scenario: cadastrando paciente com cpf invalido
    Given Estou na pagina de cadastrar paciente
    When eu preencho os dados nome 'Torres' dataNasc '2000-11-14' cpf 'asd-asd-asd-dd' email 'liricustorres@gmail.com' logradouro 'Euclides Laurindo de Souza'  complemento '705' cep '55292-818'  bairro 'Boa vista' cidade 'Garanhuns'
    Then vejo uma mensagem de erro de cpf invalido

#  Scenario: remover paciente
#    Given Estou na pagina de paciente
#    And o paciente de nome 'Torres' dataNasc '2000-11-14' cpf '027.760.354-46' email 'liricustorres@gmail.com' logradouro 'Euclides Laurindo de Souza'  complemento '705' cep '55292-818'  bairro 'Boa vista' cidade 'Garanhuns' existe
#    When eu clico para remover o paciente de cpf '027.760.354-46'
#   Then vejo que o paciente com cpf '027.760.354-46' foi corretamente removido

#  Scenario: editar paciente
#    Given Estou na pagina de paciente
#    And o paciente de nome 'Torres' dataNasc '2000-11-14' cpf '027.760.354-46' email 'liricustorres@gmail.com' logradouro 'Euclides Laurindo de Souza'  complemento '705' cep '55292-818'  bairro 'Boa vista' cidade 'Garanhuns' existe
#    When eu clico para mostrar o paciente de cpf '027.760.354-46'
#    And em seguida clico para editar o cpf '027.760.354-46' do paciente
#    And atualizo para cpf '708.280.934-40'
#    Then eu vejo que o cpf '708.280.934-40' do paciente foi atualizado
