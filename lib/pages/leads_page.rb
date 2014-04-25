class LeadsPage
  
  include PageObject
  
  link(:new_lead, :href => '/leads/new')
  links(:existing_leads, :class => 'lead-name')
  div(:list_items, :class => 'objects')
  
  def open_lead (name) 
    link_element(text: name).click
    wait_for_ajax
  end
  
end
