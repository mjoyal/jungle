require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do
   #SETUP
   before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name: Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.png'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "Cart increments when product is added" do
    visit root_path
    find('.product', match: :first).find('button.btn-primary').click
    
    expect(page).to have_text 'My Cart (1)', count: 1
    page.save_screenshot
  end
    
end
