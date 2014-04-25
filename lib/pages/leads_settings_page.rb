class LeadsSettingsPage
  
  include PageObject
  
  page_url("https://app.futuresimple.com/settings/leads/lead-status")
  
  #default view
  link(:lead_statuses, :href => '#lead-status')
  buttons(:edit_buttons, :css => '.active .btn.btn-mini.edit')
  #button(:edit_button, :css => '.active .btn.btn-mini.edit')
  
  # edit status view
  text_field(:new_name, :id => 'name')
  button(:save, :css => '.active .save')
  labels(:status_labels, :css => '.lead-status .named-objects-list .control-label')
  
  
  def go_to_lead_statuses
    lead_statuses
    wait_for_ajax
    #Watir::Wait.until { self.edit_button[1].visible? }
  end
  
  def index_for(label_name)
    status_labels_elements.find_index { |label| label.text == label_name}
  end
  
  def edit_lead_status_with_name (name, new_status) 
    edit_buttons_elements[index_for(name)].click
    wait_for_ajax
    text_field_element(value: name).value = new_status
    save
    wait_for_ajax
  end
end