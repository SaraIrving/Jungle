# Preview all emails at http://localhost:3000/rails/mailers/order_confirmation_mailer
class OrderConfirmationMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/order_confirmation_mailer/new_order_confirmation
  def new_order_confirmation
    OrderConfirmationMailer.new_order_confirmation
  end

end