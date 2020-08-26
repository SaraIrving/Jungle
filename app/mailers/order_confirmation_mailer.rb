class OrderConfirmationMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_confirmation_mailer.new_order_confirmation.subject
  #
  def new_order_confirmation(id)

    @order = Order.find(id)

    @line_items = @order.line_items

    mail to: @order.email, subject: "Order Summary for order id: #{id}"
  end
end
