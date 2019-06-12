require 'rails_helper'

describe '#ticket' do
  let(:tickets) { Ticket.retrieve_tickets['tickets'] }

  it 'should connect to the Zendesk API' do
    expect(tickets).not_to eq(nil)
  end

  it 'should return an array' do
    expect(tickets).to be_kind_of(Array)
  end

  it 'should have 100 tickets' do
    expect(tickets.length).to eq(100)
  end

  it 'should contain ticket id corresponding to the last ticket' do
    expect(tickets.last['id']).to eq(tickets.length)
  end
end
