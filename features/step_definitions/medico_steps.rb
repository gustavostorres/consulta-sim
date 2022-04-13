Given('Estou na pagina de cadastrar medico') do
  visit 'medicos/new'
  expect(page).to have_current_path('/medicos/new')
end

When('eu preencho os dados nome {string} cpf {string} email {string} especialidade {string} crm {string} e clico cadastrar') do |string, string2, string3, string4, string5|
  fill_in 'medico[nome]', :with => string
  fill_in 'medico[cpf]', :with => string2
  fill_in 'medico[email]', :with => string3
  fill_in 'medico[especialidade]', :with => string4
  fill_in 'medico[crm]', :with => string5
  click_button 'Create Medico'
end

Then('vejo que o meu cadastro {string} foi realizado') do |string|
  expect(page).to have_content(string)
  expect(page).to have_current_path(medicos_path + '/' +
                                      Medico.last.id.to_s)
end


Given('Estou na pagina de medico') do
  visit 'medicos'
  expect(page).to have_current_path('/medicos')
end

Given('o medico de nome {string} cpf {string} email {string} especialidade {string} crm {string} existe') do |string, string2, string3, string4, string5|
  visit 'medicos/new'
  fill_in 'medico[nome]', :with => string
  fill_in 'medico[cpf]', :with => string2
  fill_in 'medico[email]', :with => string3
  fill_in 'medico[especialidade]', :with => string4
  fill_in 'medico[crm]', :with => string5
  click_button 'Create Medico'
  expect(page).to have_content(string5)
end

When('eu clico para remover o medico de crm {string}') do |string|
  expect(page).to have_content(string)
  click_button "Destroy this medico"
end

Then('eu vejo que o medico com crm {string} foi corretamente removido') do |string|
  expect(page).to have_no_content(string)
  expect(page).to have_current_path('/medicos')
end

