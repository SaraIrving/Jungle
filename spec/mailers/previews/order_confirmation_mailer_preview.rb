# Preview all emails at http://localhost:3000/rails/mailers/order_confirmation_mailer
class OrderConfirmationMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/order_confirmation_mailer/new_order_confirmation
  def new_order_confirmation

    order = Order.new(
      email: 'sarakirving@gmail.com',
      total_cents: 10000,
      stripe_charge_id: 5, # returned by stripe
    )

    category = Category.new(name: 'cars')
    product = Product.new({name: "Batmobile", category: category, quantity: 2, price: 1000})

    order.line_items.new(
        product: product,
        quantity: 1,
        item_price: product.price,
        total_price: product.price * 1
      )

    
    product2 = Product.new({name: "Batmobile2", category: category, quantity: 2, price: 1000})

      order.line_items.new(
        product: product2,
        quantity: 2,
        item_price: product.price,
        total_price: product.price * 2
      )

    order.save!


    OrderConfirmationMailer.new_order_confirmation(order.id)
  end

end
