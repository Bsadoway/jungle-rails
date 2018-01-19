class ApplicationMailer < ActionMailer::Base
  default from: "no-reply@jungle.com"
  layout 'mailer'

  def welcome_email(order, products)
    @order = order
    @products = products
    mail(to: @order.email, subject: "Your order has been placed, order##{order.id}")
  end
end
