class LoginPage 
  
  include PageObject
  include DataMagic
  
  page_url("https://core.futuresimple.com/users/login")
  
  text_field(:user, :id => 'user_email')
  text_field(:passwd, :id => 'user_password')
  button(:login, :css => '.btn-primary')
  
  def log_me_in(login_data = {})
    populate_page_with data_for :login_page, login_data
    login
    wait_for_ajax
  end
    
end