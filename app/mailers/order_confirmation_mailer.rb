class OrderConfirmationMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_confirmation_mailer.new_order_confirmation.subject
  #
  def new_order_confirmation
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
