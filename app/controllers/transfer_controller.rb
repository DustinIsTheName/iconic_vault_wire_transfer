class TransferController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => [:recieve_order, :recieve_confirmation]

  def recieve_order
    headers['Access-Control-Allow-Origin'] = '*'
    puts params

    if params["subtotal_price"].to_f > 10000
      TransferMailer.instructions_email(params).deliver
    end

    render nothing: true, status: 200
  end

  def recieve_confirmation
    headers['Access-Control-Allow-Origin'] = '*'

    puts params
    # Order Attribute
    order = ShopifyAPI::Order.find params["order_id"]
    order.note_attributes << {name: "Confirmation Number", value: params["confirmation_number"]}
    order.save

    TransferMailer.followup_email(params, order).deliver
    TransferMailer.internal_email(params).deliver

    render json: params
  end

end