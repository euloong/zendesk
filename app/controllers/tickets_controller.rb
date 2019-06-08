class TicketsController < ApplicationController
  require 'will_paginate/array'

  def index
    @tickets = tickets_results['tickets']
    @tickets = @tickets.paginate(page: params[:page], per_page: 25)
  end

  private

  def tickets_results
    Ticket.retrieve_tickets
  end
end
