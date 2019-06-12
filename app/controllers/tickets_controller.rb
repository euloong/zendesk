class TicketsController < ApplicationController
  before_action :set_tickets, only: %i[index show]

  rescue_from StandardError, with: :internal_server_error

  def index
    @tickets = @tickets.paginate(page: params[:page], per_page: 25)
  end

  def show
    @ticket = @tickets[params['id'].to_i - 1]
    return if @ticket

    flash[:error] = 'Sorry the requested ticket could not be found'
    redirect_to root_path
  end

  private

  def set_tickets
    @tickets = Ticket.retrieve_tickets['tickets']
  end

  # For dev environment provides verbose error message
  # In production gives the user a friendly message
  def internal_server_error(exception)
    if Rails.env.development?
      response = {
        type: exception.class.to_s,
        message: exception.message,
        backtrace: exception.backtrace
      }
      render json: response
    else
      render :api_unavailable
    end
  end
end
