require "selenium-webdriver"
require "highline/import"

specificYear = ARGV[0]

puts "Enter your Facebook email address:"
email = gets.chomp

pass = ask("Enter your password: ") { |q| q.echo = false }

puts "Enter your Facebook user name:"
user = gets.chomp

yearUrls = (2011..2011).to_a.reverse.collect{|num| num.to_s}

if(!specificYear.nil?)
	puts "Cleaning #{specificYear} activity"
	system("ruby", "fbcleaner.rb", email, pass, user, specificYear)
	puts "Done with cleaning #{specificYear} data"
else
	yearUrls.each{|year|
		puts "Cleaning #{year} activity"
		system("ruby", "fbcleaner.rb", email, pass, user, year)
		puts "Done with cleaning #{year} data"
	}
end
