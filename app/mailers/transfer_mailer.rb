class TransferMailer < ApplicationMailer

  default to: 'dustin@wittycreative.com'

  def instructions_email(params)
    # email = params["email"]
    email = 'dustin@wittycreative.com'

    @order_id = params["id"]
    # name = params[]
    # company name = params[]

    mail(to: email, from: 'support@iconicvault.com', subject: 'Wire Transfer Instructions')
  end

  def followup_email(params, order)
    # email = order.email
    email = 'dustin@wittycreative.com'

    @confirmation_number = params["confirmation_number"]

    mail(to: email, from: 'support@iconicvault.com', subject: 'Wire Transfer Confirmation')
  end

  def internal_email(params)
    # email = 'care@iconicvault.com'
    email = 'dustin@wittycreative.com'

    @confirmation_number = params["confirmation_number"]

    mail(to: email, from: 'support@iconicvault.com', subject: 'Internal Wire Transfer Confirmation')
  end


end