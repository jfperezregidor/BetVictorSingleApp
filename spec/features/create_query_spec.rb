# spec/features/creating_farm_spec.rb
require 'rails_helper'
RSpec.describe 'Do a query and show the results', type: :feature do
   scenario 'Query to /sport and show all' , :js => true do
    visit '/'
    fill_in 'input-query', :with => "/sports"
    click_button 'btn-submit'
    sleep 2 
    a = page.driver.browser.switch_to.alert 
    a.text.should == 'A query was submitted: /sports'
    a.accept
    expect(page).to have_content 'Football'
    expect(page).to have_content 'Tennis'
    expect(page).to have_content 'Basketball'
    expect(page).to have_content 'Ice Hockey'
    expect(page).to have_content 'Table Tennis'
    expect(page).to have_content 'Winter Sports'
    expect(page).to have_content 'Volleyball'
  end
  
  scenario 'Query to /sports/100 and show events' , :js => true do
    visit '/'
    fill_in 'input-query', :with => "/sports/100"
    click_button 'btn-submit'
    sleep 2 
    a = page.driver.browser.switch_to.alert 
    a.text.should == 'A query was submitted: /sports/100'
    a.accept
    expect(page).to have_content 'Verona U19 v Torino U19'
    expect(page).to have_content 'First Half'
    expect(page).to have_content '0-0'
    expect(page).to have_content '916480900'
    expect(page).to have_content 'Shahrdari Hamedan v Palayesh Abadan'
    expect(page).to have_content '11:30'
    expect(page).to have_content '916278700'
    expect(page).to have_content 'Bargh Shiraz v Sanat Mes Kerman'
    expect(page).to have_content 'Shahrdari Arak v Machine Sazi Tabriz'
    expect(page).to have_content '916480500'
  end
  
  
  scenario 'Query to /sport/100/events/ and show outcomes' , :js => true do
    visit '/'
    fill_in 'input-query', :with => "/sports/100/events/916272900"
    click_button 'btn-submit'
    sleep 2 
    a = page.driver.browser.switch_to.alert 
    a.text.should == 'A query was submitted: /sports/100/events/916272900'
    a.accept
    expect(page).to have_content 'Verona U19'
    expect(page).to have_content 'Draw'
    expect(page).to have_content 'Torino U19'
    expect(page).to have_content '2.2'
    expect(page).to have_content '3.4'
    expect(page).to have_content '2.875'

  end
end
