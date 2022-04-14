Given('Estou na pagina de cadastrar medico') do
  visit 'medicos/new'
  expect(page).to have_current_path('/medicos/new')
end

When('eu preencho os dados nome {string} cpf {string} email {string} especialidade {string} crm {string} e clico cadastrar') do |nome, cpf, email, especialidade, crm|
  fill_in 'medico[nome]', :with => nome
  fill_in 'medico[cpf]', :with => cpf
  fill_in 'medico[email]', :with => email
  fill_in 'medico[especialidade]', :with => especialidade
  fill_in 'medico[crm]', :with => crm
  click_button 'Create Medico'
end

Then('vejo que o meu cadastro {string} foi realizado') do |crm|
  expect(page).to have_content(crm)
  expect(page).to have_current_path(medicos_path + '/' +
                                      Medico.last.id.to_s)
end


Given('Estou na pagina de medico') do
  visit 'medicos'
  expect(page).to have_current_path('/medicos')
end

Given('o medico de nome {string} cpf {string} email {string} especialidade {string} crm {string} existe') do |nome, cpf, email, especialidade, crm|
  visit 'medicos/new'
  fill_in 'medico[nome]', :with => nome
  fill_in 'medico[cpf]', :with => cpf
  fill_in 'medico[email]', :with => email
  fill_in 'medico[especialidade]', :with => especialidade
  fill_in 'medico[crm]', :with => crm
  click_button 'Create Medico'
  expect(page).to have_content(crm)
end

When('eu clico para remover o medico de crm {string}') do |crm|
  expect(page).to have_content(crm)
  click_button "Destroy this medico"
end

Then('eu vejo que o medico com crm {string} foi corretamente removido') do |crm|
  expect(page).to have_no_content(crm)
  expect(page).to have_current_path('/medicos')
end

