require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do
  
   # SETUP
   before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name: Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "a user visits the home page and clicks to add a product to their cart, they can see that the 'MyCat(0) text displayed in the nav is updated to 'MyCart(1)" do
    # visit the home page
    visit root_path

    # check that 'MyCart(0) is present in the top nav
    expect(page).to have_text('My Cart (0)')

    # find the 'Add to cart' button in the first product card and click on it
    first('article.product').find_button('Add').click

    # check that 'MyCart(1) is now present in the top nav
    expect(page).to have_text('My Cart (1)')

    # take a screenshot
    page.save_screenshot
  end

end
