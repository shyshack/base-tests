require 'spec_helper'

describe "Check if leads are added properly -> " do 
  let(:old_lead_status_name) { "New" }
  
  before(:all) do 
    # first_name will have format close to lead status 
    @new_lead_status_name = Faker::Name.first_name 
    @new_lead_name = "Zzzzzzaa" #Faker::Name.last_name
  end

  after(:all) do 
    go_to_leads_settings_status
    on(LeadsSettingsPage).edit_lead_status_with_name @new_lead_status_name, old_lead_status_name
  end

  def go_to_leads_settings_status
    on(TopMenuPage).go_to_settings
    on(SettingsPage).go_to_leads
    on(LeadsSettingsPage).go_to_lead_statuses
  end

  it "go to new lead form" do 
    visit NewLeadPage
    on(LeadsPage).wait_for_ajax
  end
  
  it "create new lead" do 
    on(NewLeadPage).new_minimal_lead @new_lead_name
    on(NewLeadPage).wait_for_ajax
  end
  
  it "check if status is new" do 
    expect(on(SpecificLeadPage).lead_status).to eq old_lead_status_name  
  end 
  
  it "go to settings -> leads -> lead statuses" do 
    go_to_leads_settings_status
  end
  
  it "edit lead status" do
    on(LeadsSettingsPage).edit_lead_status_with_name old_lead_status_name, @new_lead_status_name
  end
  
  it "go back to leads and select recently added lead" do        
    on(TopMenuPage).leads
    on(LeadsPage).wait_for_ajax
    on(LeadsPage).open_lead @new_lead_name
  end
  
  it "check if new status is displayed" do pending
    expect(on(SpecificLeadPage).lead_status).to eq @new_lead_status_name
  end
end
