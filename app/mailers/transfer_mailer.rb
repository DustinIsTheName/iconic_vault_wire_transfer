class TransferMailer < ApplicationMailer

  default to: 'dustin@wittycreative.com'

  def instructions_email(params)
    email = params["email"]
    unless email
      email = 'dustin@wittycreative.com'
    end

    @order_id = params["id"]
    @name = params["name"]
    # company name = params[]

    mail(to: email, from: 'care@iconicvault.com', subject: "Wire Transfer Instructions for Order #{@name}")
  end

  def followup_email(params, order, test = false)
    email = order.email
    unless email
      email = 'dustin@wittycreative.com'
    end

    if test
      email = 'dustin@wittycreative.com'
    end

    @confirmation_number = params["confirmation_number"]
    @name = order.name

    mail(to: email, from: 'care@iconicvault.com', subject: "Wire Transfer Confirmation for Order #{@name}")
  end

  def internal_email(params, test = false)
    email = 'care@iconicvault.com'
    if test
      email = 'dustin@wittycreative.com'
    end

    @confirmation_number = params["confirmation_number"]

    mail(to: email, from: 'care@iconicvault.com', subject: 'Internal Wire Transfer Confirmation')
  end


end