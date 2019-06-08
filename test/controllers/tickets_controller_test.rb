# frozen_string_literal: true

require 'test_helper'

class TicketsControllerTest < ActionDispatch::IntegrationTest
  test 'should get search' do
    get tickets_search_url
    assert_response :success
  end
end
