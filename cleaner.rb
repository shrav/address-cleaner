require 'lob'
require 'csv'

# Initialize Lob Object
Lob.api_key = 'xxx'
@lob = Lob.load

# Row 0 is the Name. Other Rows are as Follows Below.

CSV.open("new.csv", "wb") do |csv|
	CSV.foreach("old.csv") do |row|
	  verify = @lob.addresses.verify(
	      address_line1: row[1],
	      address_line2: row[2],
	      city:    row[3],
	      state:   row[4],
	      zip:     row[5]
	  )
	csv << [row[0], verify['address']['address_line1'], verify['address']['address_line2'], verify['address']['address_city'], verify['address']['address_state'], verify['address']['address_zip'], verify['address']['address_country']]
	end
end
