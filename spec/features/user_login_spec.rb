require 'rails_helper'

RSpec.feature "UserLogins", type: :feature, js: true do

  
  let!(:user) {User.create!({first_name: 'Good', last_name: 'boy', email: 'dog@gmail.com', password: 'ilovecats', password_confirmation: 'ilovecats'})}

  scenario "Test existing users can login successfully and are redirected to the home page once they are logged in" do

    # go to the login page
    visit '/login'


    # fill out form details
    fill_in 'Email', with: 'dog@gmail.com'
    fill_in 'Password', with: 'ilovecats'

    # click 'Submit' button
    click_button 'Submit'
      


    # check that you are redirected to the home page and are signed in
    expect(page).to have_content 'Products'

    # check that the user is logged in and that the nav is displaying their name 
    expect(page).to have_content 'Signed in as Good'

    # take a screenshot to verify 
    page.save_screenshot
  end


end
