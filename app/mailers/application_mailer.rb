class ApplicationMailer < ActionMailer::Base
  default from: "no-reply@jungle.com"
  layout 'mailer'

  def welcome_email(order)
    @order = order
    @products = Product.joins(:line_items).where("order_id =?", order.id)
    @items = LineItem.where(order_id: order.id)

    mail(to: @order.email, subject: "Your order has been placed, order##{order.id}")
  end
end
