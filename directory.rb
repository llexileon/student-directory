
# Student directory work in progress April 1st 2014 #

def print_header 
	print "The students of my cohort at Makers Academy\n"
    print "-------------------------------------------\n"
end

# Ask for user input to compile student data #

def input_students
	print "Please enter the names of the students you'd like to add to the database \n"
	print "To finish, just hit return twice \n"
	# create an empty array #
	students = []
	#get the first name
	name = gets.chomp
		#while the name is not empty, repeat this code
		while !name.empty? do
		# add the student hash to the array
		students << {:name => name, :cohort => :March}
		#get another name from the user
		name = gets.chomp
		end
#return the array of students
students
end

students = input_students

def printer(students)
	#Calls block with two arguments, the item and its index, for each item in enum.
	students.each_with_index do |student, index|
		print "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort) \n"
	end
end

# Print total student count with .length #
def print_footer(students)
	if students.length <= 1
		print ""
		print "Overall, we have #{students.length} great student \n"
	else 
		print ""
		print "Overall, we have #{students.length} great students \n"
	end
end

# Call the methods for output #

print_header
printer(students)
print_footer(students)
