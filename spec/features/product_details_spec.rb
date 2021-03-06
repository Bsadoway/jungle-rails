require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario 'should show the product' do
    #ACTIONS
    visit root_path
    first('.actions').find_link('Details').click
    sleep(1)

    #DEBUG
    save_screenshot
    expect(page).to have_css 'section.products-show'
    expect(page).to have_css "img[src*='apparel1.jpg']"

  end
end
