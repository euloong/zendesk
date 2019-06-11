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
end

#   TO DO:
#   # unable to find the link
#   test 'visit page 3' do
#     visit '/'
#     click_link('/?page=3')
#   end
# end

# find(“a[href=‘#{edit_users_path}’]“).click
