class NewLeadPage
  
  include PageObject
  
  page_url("https://app.futuresimple.com/leads/new")
  
  text_field(:first_name, :id => 'lead-first-name')
  text_field(:last_name, :id => 'lead-last-name')
  text_field(:company_name, :id => 'lead-company-name')
  text_field(:first_name, :id => 'lead-first-name')
  select_list(:owner, :name => 'owner_id')
  text_field(:title, :id => 'lead-title')
  select_list(:status, :name => 'status_id')
  button(:save, :css => '.btn-primary')
  
  
  def new_minimal_lead (last_name = "")
    self.last_name = last_name
    save
    last_name
  end
  
  
end
