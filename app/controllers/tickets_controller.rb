class TicketsController < ApplicationController
  require 'will_paginate/array'

  rescue_from StandardError, with: :api_unavailable

  def index
    @tickets = tickets_results['tickets']
    @tickets = @tickets.paginate(page: params[:page], per_page: 25)
  end

  def show
    @tickets = tickets_results['tickets']
    @ticket = @tickets[params['id'].to_i - 1]
    if @ticket.nil?
      flash[:error] = 'Sorry the requested ticket could not be found'
      redirect_to root_path
    end
  end

  private

  def tickets_results
    Ticket.retrieve_tickets
  end

  def api_unavailable
    render :api_unavailable
  end
end
