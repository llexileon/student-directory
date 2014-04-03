
# Student directory work in progress April 3rd 2014 #

# Ask for user input to compile student data #
def multiple_user_inputer(*students)
	
	students = []
    name = "placeholder"
    chort = "placeholder"
    city = "placeholder"
    hobby = "placeholder"
    answer = "placeholder"
    while !name.empty? do
    	puts "Please enter the name of the student you'd like to add to the database \n".center(50)
    	name = gets.chomp
    	puts "Please enter the cohort of the student you'd like to add to the database \n".center(50)
    	cohort = gets.chomp
    	puts "Please enter the home city of the student you'd like to add to the database \n".center(50)
    	city = gets.chomp
    	puts "Please enter the hobby of the student you'd like to add to the database \n".center(50)
    	hobby = gets.chomp
	
    each_student = {:name => name, :cohort => cohort, :city => city, :hobby => hobby}
    each_student.default = "Unknown"

    students << each_student

    puts "For Student List, enter 'List' Or, to continue adding students, enter: 'Next'"
    answer = gets.chomp
    if answer.downcase == "list" ; return display(students) end
end
display(students) 
end

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

def student_list_message
    print "The students at Makers Academy!\n".center(50)
    print "------------------------------\n".center(5)
end

def display(students)
	ticker = 0
    student_list_message
	while ticker < students.count 	
	print "#{ticker+1}. #{students[ticker][:name]} from #{students[ticker][:city]} joined the #{students[ticker][:cohort]} cohort and loves #{students[ticker][:hobby]} \n"
	ticker += 1
	end
    print_footer(students)
end




# Call the methods for output #
multiple_user_inputer