class Ticket
  def self.retrieve_tickets
    url = 'https://eajconsulting.zendesk.com/api/v2/tickets.json'
    query = open(
      url,
      http_basic_authentication: [ENV['ZENDESK_USERNAME'],
                                  ENV['ZENDESK_API_TOKEN']]
    ).read
    JSON.parse(query)
  end
end
