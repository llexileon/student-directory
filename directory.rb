
# Student directory work in progress April 1st 2014 #

def print_header 
	print "The students at Makers Academy!\n".center(50)
    print "------------------------------\n".center(5)
end

# Ask for user input to compile student data #

def input_students
	print "Please enter the name of the first student you'd like to add to the database \n".center(50)
	#get the first name
	name = gets.chomp
	print "Please enter the cohort of the first student you'd like to add to the database \n".center(50)
	cohort = gets.chomp
	print "Please enter the home city of the first student you'd like to add to the database \n".center(50)
	city = gets.chomp
	print "Please enter the hobby of the first student you'd like to add to the database \n".center(50)
	hobby = gets.chomp


	# create an empty array #
	students = []
		#while the name is not empty, repeat this code
		while !name.empty? do
		# add the student hash to the array
		students << {:name => name, :cohort => cohort, :city => city, :hobby => hobby}
		#get another name from the user
	print "Please enter the next student name, followed by thier cohort, city, and hobby \n".center(50)
	print "( Or to finish, just hit your enter or return key 4 times ;D ) \n".center(50)
		name = gets.chomp
		cohort = gets.chomp
		city = gets.chomp
		hobby = gets.chomp
		end
#return the array of students
students
end



students = input_students


# def select_namesunder12(students)
# namesunder12 = students.select {|student| student[:name].length <= 12}
# # namesunder12.each{|student| student[:name]}
# end

# def print_student_namesunder12(students)
# 	students.each{|student| puts student[:name]}
# end



# def select_nameswitha(students)
# students_withA = students.select {|student| student[:name].downcase.start_with?("a")}
# # students_withA.each{|student| puts student[:name]}
# end

# def print_student_nameswitha(students)
# 	students.each{|student| puts student[:name]}
# end





def whilestudent_index(students)
	ticker = 0
	while ticker < students.count 	
	print "#{ticker+1}. #{students[ticker][:name]} from #{students[ticker][:city]} joined the #{students[ticker][:cohort]} cohort and loves #{students[ticker][:hobby]} \n"
	ticker += 1
	end
end




# def student_index(students)
# 	#Calls block with two arguments, the item and its index, for each item.
# 	students.each_with_index do |student, index|
# 		print "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort) \n"
# 	end
# end


# Print total student count with .length #
def print_footer(students)
	if students.length <= 1
		print "\n"
		print "Overall, we have #{students.length} great student \n".center(50)
	else
		print "\n"
		print "Overall, we have #{students.length} great students \n".center(50)
	end
end

# Call the methods for output #

print_header
# print_student_namesunder12(select_namesunder12(students))
# print_student_nameswitha(select_nameswitha(students))
whilestudent_index(students)
# student_index(students)
print_footer(students)
