require "rails_helper"

RSpec.describe OrderConfirmationMailer, type: :mailer do
  describe "new_order_confirmation" do
    let(:mail) { OrderConfirmationMailer.new_order_confirmation }

    it "renders the headers" do
      expect(mail.subject).to eq("New order confirmation")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
