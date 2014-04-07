
# Student directory work in progress April 3rd 2014 #
def welcome
    puts "Welcome to the Makers Academy Student Database! \n".center(70)
    multiple_user_inputer
end

@students = []

# Ask for user input to compile student data #
def multiple_user_inputer(*students)
	
    name = "placeholder"
    chort = "placeholder"
    city = "placeholder"
    hobby = "placeholder"
    answer = ""

    while !name.empty? do
    	puts "Please enter the name of the student you'd like to add to the database \n".center(50)
    	name = gets.chomp
    	puts "Please enter the cohort of the student you'd like to add to the database \n".center(50)
    	cohort = gets.chomp
    	puts "Please enter the home city of the student you'd like to add to the database \n".center(50)
    	city = gets.chomp
    	puts "Please enter the hobby of the student you'd like to add to the database \n".center(50)
    	hobby = gets.chomp

        if !name.empty? && !cohort.empty? && !city.empty? && !hobby.empty? 

            each_student = {:name => name, :cohort => cohort, :city => city, :hobby => hobby}
            @students << each_student
            puts "For Student List, enter 'List' Or, to continue adding students, enter: 'Next'"
            answer = gets.chomp
            if answer.downcase == "list" ; return display(@students) end
        else
            puts "Your entry was incomplete and will not be saved, you must complete all fiends"
            return multiple_user_inputer
        end
    end
end


def makers_academy_header
    puts  "The Students Of Makers Academy!".center(50)
    puts   "------------------------------".center(50)
end


def display(students)
	ticker = 0
    makers_academy_header
	while ticker < students.count 	
	print "#{ticker+1}. #{students[ticker][:name]} from #{students[ticker][:city]} joined the #{students[ticker][:cohort]} cohort and loves #{students[ticker][:hobby]} \n"
	ticker += 1
	end
    makers_footer(students)
end

# Print total student count with .length #
def makers_footer(students)
    if students.length <= 1
        print "\n"
        print "Overall, we have #{students.length} great student \n".center(50)
    else
        print "\n"
        print "Overall, we have #{students.length} great students \n".center(50)
    end
end


# Call the method for output #
welcome