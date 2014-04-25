class TopMenuPage
  
  include PageObject
  
  # top menu
  link(:settings_menu, :class => 'dropdown-toggle')
  link(:leads, :id => 'nav-leads')
  link(:contacts, :id => 'nav-contacts')
  link(:sales, :id => 'nav-sales')
  
  # settings dropdown
  link(:settings, :href => '/settings/profile')
  
  def go_to_settings
    settings_menu
    wait_for_ajax
    settings
    wait_for_ajax
  end
  
end