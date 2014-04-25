$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

require 'rspec'
require 'page-object'
require 'data_magic'
require 'watir-webdriver'
require 'require_all'
require 'pry'

require_all 'lib'
  
RSpec.configure do |config|
  config.include PageObject::PageFactory
  
  
  config.before(:all) do 
    @browser = Watir::Browser.new :firefox
    PageObject.javascript_framework= :jquery
    visit LoginPage
    on(LoginPage).log_me_in
  end
  
  config.after(:all) do 
    @browser.close
  end
end
