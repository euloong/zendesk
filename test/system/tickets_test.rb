require 'application_system_test_case'

class TicketsTest < ApplicationSystemTestCase
  test 'visiting the index' do
    visit '/'
    assert_selector 'h2', text: 'Zendesk Ticket viewer'
  end

  test 'should report error' do
    assert_raises(NameError) do
      some_undefined_variable
    end
  end

  test 'unknown ticket' do
    visit '/tickets/999'
    assert_selector 'div',
                    text: 'Sorry the requested ticket could not be found'
  end

  test 'back button' do
    visit '/tickets/1'
    click_link('Back')
    assert_selector 'h2', text: 'Zendesk Ticket viewer'
  end

  test 'show ticket details' do
    visit '/'
    click_link('1')
    assert_selector 'p', text: 'Ticket ID: 1'
  end

  test 'page 3 selector is present' do
    visit '/'
    assert_selector(:css, 'a[href="/?page=3"]')
    # I wanted to test clicking the link to page 3
    # and checking that the correct page loads
    # but I couldn't get the below code to work correctly
    # click_link('a[href="/?page=3"]')
    # assert_selector '51', text: 'esse ut qui do aute'
  end
end
