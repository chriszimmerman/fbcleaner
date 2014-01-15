require "selenium-webdriver"

email = ARGV[0]
pass = ARGV[1]
user = ARGV[2]
year = ARGV[3]

driver = Selenium::WebDriver.for :chrome
driver.navigate.to "http://facebook.com"

username = driver.find_element(:name, 'email')
username.send_keys email

password = driver.find_element(:name, 'pass')
password.send_keys pass
  
loginbutton = driver.find_element(:id, "loginbutton")
loginbutton.click

profileBox = driver.find_element(:class, "fbxWelcomeBoxName")
profileBox.click

while true
	driver.navigate.to "http://facebook.com/#{user}/timeline/#{year}"
	sleep 2

	begin
		arrow = driver.find_elements(:class, "_dxs").first
		sleep 1
		arrow.click
	rescue Exception => e
		exit
	end
	
	sleep 2
	
	begin
		deleteItem = driver.find_element(:xpath, "//span[contains(text(),'Delete')]")
		sleep 2
		deleteItem.click
		sleep 2
		okButton = driver.find_element(:name, "ok")
		okButton.click
	rescue 
		deleteItem = driver.find_element(:xpath, "//span[contains(text(),'Hide')]")
		sleep 2
		deleteItem.click
		puts "Ok button not found"
	end
end
