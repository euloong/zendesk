class TicketsController < ApplicationController
  require 'will_paginate/array'

  # rescue_from with: :api_unavailable
  # rescue_from StandardError, with: :internal_server_error

  def index
    @tickets = tickets_results['tickets']
    @tickets = @tickets.paginate(page: params[:page], per_page: 25)
  end

  def show
    @tickets = tickets_results['tickets']
    @ticket = @tickets[params['id'].to_i - 1]
  end

  private

  def tickets_results
    Ticket.retrieve_tickets
  end

  # def api_unavailable
  #   render :api_unavailable
  # end

  # def internal_server_error(exception)
  #   if Rails.env.development?
  #     response = { type: exception.class.to_s, message: exception.message, backtrace: exception.backtrace }
  #   else
  #     response = { error: "Internal Server Error" }
  #   end
  #   render json: response, status: :internal_server_error
  # end
end
