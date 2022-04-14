Given('Estou na pagina de cadastrar paciente') do
  visit 'pacientes/new'
  expect(page).to have_current_path('/pacientes/new')
end

When('eu preencho os dados nome {string} dataNasc {string} cpf {string} email {string} logradouro {string}  complemento {string} cep {string}  bairro {string} cidade {string}') do |nome, dataNasc, cpf, email, logradouro, complemento, cep, bairro, cidade|
  fill_in 'paciente[nome]', :with => nome
  fill_in 'paciente[dataNasc]', :with => dataNasc
  fill_in 'paciente[cpf]', :with => cpf
  fill_in 'paciente[email]', :with => email
  fill_in 'paciente[endereco_attributes][logradouro]', :with => logradouro
  fill_in 'paciente[endereco_attributes][complemento]', :with => complemento
  fill_in 'paciente[endereco_attributes][cep]', :with => cep
  fill_in 'paciente[endereco_attributes][bairro]', :with => bairro
  fill_in 'paciente[endereco_attributes][cidade]', :with => cidade
  click_button 'Create Paciente'
end

Then('vejo que o meu cadastro {string} foi efetuado') do |cpf|
  expect(page).to have_content(cpf)
  expect(page).to have_current_path(pacientes_path + '/' +
                                      Paciente.last.id.to_s)
end

Then('vejo uma mensagem de erro de cpf invalido') do
  expect(page).to have_content('Cpf Formato: XXX.XXX.XXX-XX')
end



=begin
Given('Estou na pagina de paciente') do
  visit 'pacientes'
  expect(page).to have_current_path('/pacientes')
end

Given('o paciente de nome {string} dataNasc {string} cpf {string} email {string} logradouro {string}  complemento {string} cep {string}  bairro {string} cidade {string} existe') do |nome, dataNasc, cpf, email, logradouro, complemento, cep, bairro, cidade|
  visit 'pacientes/new'
  fill_in 'paciente[nome]', :with => nome
  fill_in 'paciente[dataNasc]', :with => dataNasc
  fill_in 'paciente[cpf]', :with => cpf
  fill_in 'paciente[email]', :with => email
  fill_in 'paciente[endereco_attributes][logradouro]', :with => logradouro
  fill_in 'paciente[endereco_attributes][complemento]', :with => complemento
  fill_in 'paciente[endereco_attributes][cep]', :with => cep
  fill_in 'paciente[endereco_attributes][bairro]', :with => bairro
  fill_in 'paciente[endereco_attributes][cidade]', :with => cidade
  click_button 'Create Paciente'
  expect(page).to have_content(cpf)
end

When('eu clico para remover o paciente de cpf {string}') do |cpf|
  expect(page).to have_content(cpf)
  click_button "Destroy this paciente"
end

Then('vejo que o paciente com cpf {string} foi corretamente removido') do |cpf|
  expect(page).to have_content(cpf)
  expect(page).to have_current_path(pacientes_path + '/' +
                                      Paciente.last.id.to_s)
end




Given('Estou na pagina de paciente') do
  visit 'pacientes'
  expect(page).to have_current_path('/pacientes')
end

Given('o paciente de nome {string} dataNasc {string} cpf {string} email {string} logradouro {string}  complemento {string} cep {string}  bairro {string} cidade {string} existe') do |nome, dataNasc, cpf, email, logradouro, complemento, cep, bairro, cidade|
  visit 'pacientes/new'
  fill_in 'paciente[nome]', :with => nome
  fill_in 'paciente[dataNasc]', :with => dataNasc
  fill_in 'paciente[cpf]', :with => cpf
  fill_in 'paciente[email]', :with => email
  fill_in 'paciente[endereco_attributes][logradouro]', :with => logradouro
  fill_in 'paciente[endereco_attributes][complemento]', :with => complemento
  fill_in 'paciente[endereco_attributes][cep]', :with => cep
  fill_in 'paciente[endereco_attributes][bairro]', :with => bairro
  fill_in 'paciente[endereco_attributes][cidade]', :with => cidade
  click_button 'Create Paciente'
  expect(page).to have_content(cpf)
end

When('eu clico para mostrar o paciente de cpf {string}') do |cpf|
  expect(page).to have_content(cpf)
  click_link "m-#{cpf}"          index.html paciente <%= link_to "Show this paciente", paciente, id: "m-#{paciente.cpf}" %>
end

When('em seguida clico para editar o cpf {string} do paciente') do |cpf|
  expect(page).to have_content(cpf)
  click_link "Edit this paciente"
end

When('atualizo para cpf {string}') do |cpf|
  expect(page).to have_content(cpf)
  fill_in 'paciente[cpf]', :with => cpf
  click_button "Update Paciente"
end

Then('eu vejo que o cpf {string} do paciente foi atualizado') do |cpf|
  expect(page).to have_no_content(cpf)
  expect(page).to have_current_path('/pacientes')
end
=end