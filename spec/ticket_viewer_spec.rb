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

  # error = { 'error' => 'Sorry the requested ticket could not be found' }
  it 'should return an error when unknown ticket id is used' do
    expect(tickets.find { |t| t['id'] == 999 }).to eq(nil)
  end
end
