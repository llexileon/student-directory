
# Student directory work in progress April 1st 2014

puts "The students of my cohort at Makers Academy"
puts "-------------------------------------------"

# Names of students #

students = [
 "Steve Musgrave",
 "Sroop Sunar",
 "Colin Marshall",
 "Josh Fail-Brown",
 "Louise Lai",
 "Robin Doble",
 "Alex Wong",
 "Scott Dimmock",
 "Muhanad Al-Rubaiee",
 "Shelley Hope",
 "Will Hall",
 "Oliver Delevingne",
 "Nico",
 "Apostolis",
 "Stefania",
 "Jennifer Jentle",
 "Robert Leon",
 "Emma Williams",
 "Joey Wolf",
 "Julie Walker",
]

students.each do |student|
	puts student
end

# Print total student count 

puts ""
puts "Overall, we have #{students.length} great students"