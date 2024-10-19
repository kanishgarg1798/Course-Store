class WebhooksController < ApplicationController
    skip_before_action :verify_authenticity_token

    def stripe
        event = nil
        payload = request.body.read
        sig_header = request.env['HTTP_STRIPE_SIGNATURE']

        # Rails.logger.info("Received webhook with payload: #{payload}")
        # Rails.logger.info("Received webhook with signature header: #{sig_header}")

        begin
            event = Stripe::Webhook.construct_event(
                payload, sig_header, Rails.application.credentials.stripe[:webhook_secret]
            )
        rescue JSON::ParserError => e
            # Rails.logger.error("JSON::ParserError: #{e.message}")
            render json: { error: 'Invalid payload' }, status: 400
            return
        rescue Stripe::SignatureVerificationError => e
            # Rails.logger.error("Stripe::SignatureVerificationError: #{e.message}")
            render json: { error: 'Invalid signature' }, status: 400
            return
        end

        case event['type']
        when 'checkout.session.completed'
            session = event['data']['object']
            order = Order.find_by(stripe_checkout_session_id: session['id']) # Use session['id']

            if order
                order.update(status: 'paid')
            end
        end

        render json: { message: 'success' }, status: :ok # Explicitly set success status
    end
end