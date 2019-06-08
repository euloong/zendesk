class Ticket
  def self.retrieve_tickets
    require 'json'
    require 'open-uri'

    url = 'https://eajconsulting.zendesk.com/api/v2/tickets.json'
    user = 'euloong@hotmail.com' + '/token'
    token = 'dLr9GgjDt1DkvbfHUuhpTywO4fA9OLe8NmypG059'

    query = open(url, http_basic_authentication: [user, token]).read
    JSON.parse(query)
  end
end
