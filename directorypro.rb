
# Student directory Pro in progress April 9th 2014 #
def welcome
    puts   "---------------------------------------------".center(70)
    puts "Welcome to the Makers Academy Student Database!".center(70)
    puts   "---------------------------------------------".center(70)
    interactive_menu
end

def interactive_menu
	puts "Please select from the following options:
	'I' Input students
	'L' List students
	'X' Exit"
	selections = gets.chomp
	selection = selections.upcase
	interactive_menu_case(selection)
end

def interactive_menu_case(selection)
	case selection
	when "I"
		user_input
	when "L"
		student_list_print(@students)
	when "X"
	else
		puts "No selection registered, please try again"
		interactive_menu
	end
end


@students = []
@months = ["January","February","March","April","May","June","July","August","September","October","November","December"]

def placeholder
	["placeholder", "placeholder", "placeholder", "placeholder"]
end

#collect data for students array
def user_input
	#set variables
name, cohort, city, hobby = placeholder
	#prompt the user for input
	puts "Please enter the name of the student you'd like to add to the database \n".center(50)
    name = gets.chomp
    
    puts "Please enter the cohort of the student you'd like to add to the database \n".center(50)
    cohort_input = gets.chomp
    cohort = cohort_input.capitalize
    
    puts "Please enter the home city of the student you'd like to add to the database \n".center(50)
    city = gets.chomp
    
    puts "Please enter the hobby of the student you'd like to add to the database \n".center(50)
    hobby = gets.chomp

    validate_user_input(name, cohort, city, hobby)

end

def validate_user_input(name, cohort, city, hobby)
	#if all data was entered correctly, send to students array

	if !name.empty? &&  ( !cohort.empty? && @months.include?("#{cohort}")) && !city.empty? && !hobby.empty?
				single_student = {month: "#{cohort}", name: name, city: city, hobby: hobby}
				@students << single_student
				list_or_continue
			elsif !@months.include?("#{cohort}") && !name.empty? && !cohort.empty? && !city.empty? && !hobby.empty?
				puts "You did not enter a calendar month for your cohort, please try again!\n\n"
				user_input
			else name.empty? && cohort.empty? && city.empty? && hobby.empty?
				#prompt when u haven´t entered all information, calls put_in_user
				puts "Please complete in all fields\n!"
				list_or_continue
			end
end

def list_or_continue
	puts "For Student List, enter 'List' Or, to continue adding students, enter: 'Next'".center(50)
	answer = gets.chomp
	#if user wants to make more entries hit return, to see list enter list, calls student_list_printer
	if answer.downcase == "list" ; return student_list_print(@students) end
	put_in_user
end

def makers_academy_header
    puts  "The Students Of Makers Academy!".center(50)
    puts   "------------------------------".center(50)
end

def empty_list
	puts "Sorry, no entries have been entered so the list is empty!\n"
	puts "To continue type 'continue', to quit type 'quit'"
	answer = gets.chomp
	case answer
		when "continue" 
		put_in_user
		when "quit"  
		else 
		puts "Error!"
	end
end

def student_list_print(students)
	# puts students.inspect
	if students.size > 0 
	makers_academy_header
	sort_students = students.sort_by{|student| @months.index(student[:month])}
	sort_students.each_with_index{|student, counter| puts "#{counter + 1}. #{student[:month]}: #{student[:name]} from #{student[:city]} loves #{student[:hobby]}"}
	makers_footer(students)
else
    empty_list
	end
end

def makers_footer(students)
	#puts @students array into a file
	File.open("student", "w") { |f| f.write @students}
	#if only one student print student, with more print students
	if students.count > 1
        print "\n"
        print "Overall, we have #{students.length} great student \n".center(50)
    else
        print "\n"
        print "Overall, we have #{students.length} great students \n".center(50)
    end
end

# Call the method for output #
welcome