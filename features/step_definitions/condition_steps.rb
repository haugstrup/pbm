Then /^"([^"]*)"'s "([^"]*)" should have the condition "([^"]*)"$/ do |location_name, machine_name, condition|
  LocationMachineXref.where('machine_id = ? and location_id = ?',
    Machine.find_by_name(machine_name).id,
    Location.find_by_name(location_name).id
  ).first.condition.should == condition
end

Given /^I update the machine condition for "([^"]*)"'s "([^"]*)" to be "([^"]*)"$/ do |location_name, machine_name, condition|
  lmx = LocationMachineXref.where('machine_id = ? and location_id = ?',
    Machine.find_by_name(machine_name).id,
    Location.find_by_name(location_name).id
  ).first

  page.find("div#machine_condition_lmx_#{lmx.id}.machine_condition_lmx").click
  fill_in("new_machine_condition_#{lmx.id}", :with => condition)
end

Given /^I update the location condition for "([^"]*)" to be "([^"]*)"$/ do |name, desc|
  l = Location.find_by_name(name)

  page.find("div#desc_show_location_#{l.id}.desc_show_location").click
  fill_in("new_desc_#{l.id}", :with => desc)
end

Given /^I press save for the machine condition for "([^"]*)"'s "([^"]*)"$/ do |location_name, machine_name|
  lmx = LocationMachineXref.where('machine_id = ? and location_id = ?',
    Machine.find_by_name(machine_name).id,
    Location.find_by_name(location_name).id
  ).first

  page.find("input#save_machine_condition_#{lmx.id}").click
end

Given /^I press cancel for the machine condition for "([^"]*)"'s "([^"]*)"$/ do |location_name, machine_name|
  lmx = LocationMachineXref.where('machine_id = ? and location_id = ?',
    Machine.find_by_name(machine_name).id,
    Location.find_by_name(location_name).id
  ).first

  page.find("input#cancel_machine_condition_#{lmx.id}").click
end
