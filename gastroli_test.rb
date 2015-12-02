require 'selenium-webdriver'
require 'test/unit'
# require_relative '../helper_methods'

class Gastroli_ua < Test::Unit::TestCase
  # include Helper_Method


  def setup
    @browser = Selenium::WebDriver.for :firefox
    @wait = Selenium::WebDriver::Wait.new(:timeout => 10)
  end

  def teardown
    @browser.quit
  end

  def test_buy_with_long_last_name
    @browser.get 'https://gastroli.ua/tickets/5nizza/buy'

    @browser.find_element(:id, 'fanzone_2_').click
    @wait.until { @browser.find_element(:class, 'remove_ticket').displayed? }

    @browser.find_element(:name, 'first_name').send_keys 'First Name'
    @browser.find_element(:name, 'last_name').send_keys '
    123456789 123456789 123456789 123456789 123456789 123456789 123456789 123456789 123456789 123456789'
    # 123456789 123456789 123456789 123456789 123456789 123456789 123456789 123456789 123456789 123456789
    # 123456789 123456789 123456789 123456789 123456789 1234'
    @browser.find_element(:name, 'client_email').send_keys 'i@i.ua'
    @browser.find_element(:name, 'agree').click
    @browser.find_element(:class, 'progress-wrap').click
    @browser.find_element(:name, 'tel').send_keys '2222222222'
    @browser.find_element(:class, 'progress-wrap').click

    @wait.until { @browser.find_element(:id, 'make_payment').displayed?}
    assert_equal(true, @browser.find_element(:id, 'make_payment').displayed?)
  end

end
