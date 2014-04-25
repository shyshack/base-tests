class SettingsPage
  include PageObject

  link(:leads_settings, :href => '/settings/leads')
  link(:contacts_settings, :href => '/settings/contacts' )
  link(:deals_settings, :href => '/settings/deals')
  
  def go_to_leads
    leads_settings
    wait_for_ajax
  end
  
end