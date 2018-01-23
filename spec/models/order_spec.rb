require 'rails_helper'

RSpec.describe Order, type: :model do
  describe 'After creation' do
    before :each do
      # Setup at least two products with different quantities, names, etc
      @product1 = Product.create!(name: 'Burger', description: 'With pickles' , quantity: 10, price_cents: 400, category_id: 1)
      @product2 = Product.create!(name: 'Malk', description: 'Now with Vitamin R', quantity: 2, price_cents: 1000, category_id: 2)
      # Setup at least one product that will NOT be in the order
      @product3 = Product.create!(name: 'Rocket Lawn Chair', description: 'Shoots you to the moon', quantity: 5, price_cents: 1500, category_id: 2)

    end
    # pending test 1
#    xit 'deducts quantity from products based on their line item quantities' do
      # TODO: Implement based on hints below
      # 1. initialize order with necessary fields (see orders_controllers, schema and model definition for what is required)
#      @order = Order.new()
      # 2. build line items on @order
      # ...
      # 3. save! the order - ie raise an exception if it fails (not expected)
#      @order.save!
      # 4. reload products to have their updated quantities
#      @product1.reload
#      @product2.reload
      # 5. use RSpec expect syntax to assert their new quantity values
      # ...
#    end
    # pending test 2
#    xit 'does not deduct quantity from products that are not in the order' do
      # TODO: Implement based on hints in previous test
#    end
  end
end
