
# Student directory work in progress April 1st 2014 #

def print_header 
	puts "The students of my cohort at Makers Academy"
    puts "-------------------------------------------"
end

# Names of students in array #

students = [
 {:name => "Steve Musgrave", :cohort => :March},
 {:name => "Sroop Sunar", :cohort => :March},
 {:name => "Colin Marshall", :cohort => :March},
 {:name => "Josh Fail-Brown", :cohort => :March},
 {:name => "Louise Lai", :cohort => :March},
 {:name => "Robin Doble", :cohort => :March},
 {:name => "Alex Wong", :cohort => :March},
 {:name => "Scott Dimmock", :cohort => :March},
 {:name => "Muhanad Al-Rubaiee", :cohort => :March},
 {:name => "Shelley Hope", :cohort => :March},
 {:name => "Will Hall", :cohort => :March},
 {:name => "Oliver Delevingne", :cohort => :March},
 {:name => "Nico", :cohort => :March},
 {:name => "Apostolis", :cohort => :March},
 {:name => "Stefania", :cohort => :March},
 {:name => "Jennifer Jentle", :cohort => :March},
 {:name => "Robert Leon", :cohort => :March},
 {:name => "Emma Williams", :cohort => :March},
 {:name => "Joey Wolf", :cohort => :March},
 {:name => "Julie Walker", :cohort => :March}
]

def print(students)
	students.each do |student|
		puts "#{student[:name]} (#{student[:cohort]} cohort)"
	end
end


# Print total student count with .length #
def print_footer(students)
puts ""
puts "Overall, we have #{students.length} great students"
end

# Call the methods for output #

print_header
print(students)
print_footer(students)
