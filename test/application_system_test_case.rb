# frozen_string_literal: true

require 'test_helper'

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by :headless_chrome
end
# :selenium, using: :chrome, screen_size: [1400, 1400]
