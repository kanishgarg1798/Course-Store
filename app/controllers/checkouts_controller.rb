class CheckoutsController < ApplicationController
    def create
        course = Course.find(params[:course_id])
        user = User.find(params[:user_id])

        session = Stripe::Checkout::Session.create({
            payment_method_types: ['card'],
            line_items: [{
                price_data: {
                    currency: 'usd',
                    product_data: {
                        name: course.title,
                    },
                    unit_amount: (course.price * 100).to_i,
                },
                quantity: 1,
            }],
            mode: 'payment',
            success_url: "#{root_url}success?session_id={CHECKOUT_SESSION_ID}",
            cancel_url: "#{root_url}cancel",
        })

        order = Order.create(
            user: user,
            course: course,
            status: 'pending',
            stripe_checkout_session_id: session.id
        )

        redirect_to session.url, allow_other_host: true
    end

    def success

    end

    def cancel

    end
end