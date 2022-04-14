Feature:
  As a medico
  I want to criar, editar, remover e visualizar meu cadastro
  So that possa manter atualizado meu cadastro

  Scenario: cadastrar medico
    Given Estou na pagina de cadastrar medico
    When eu preencho os dados nome 'Aline' cpf '864.106.794-91' email 'torresbcc@outlook.com' especialidade 'Ortopedista' crm '77777777-7' e clico cadastrar
    Then vejo que o meu cadastro 'Aline' foi realizado

  Scenario: remover medico
    Given Estou na pagina de medico
    And o medico de nome 'Aline' cpf '864.106.794-91' email 'torresbcc@outlook.com' especialidade 'Ortopedista' crm '77777777-7' existe
    When eu clico para remover o medico de crm '77777777-7'
    Then eu vejo que o medico com crm '77777777-7' foi corretamente removido