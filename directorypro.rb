require "color_text"
# Student directory Pro in progress April 9th 2014 #
def welcome
    puts   "---------------------------------------------".center(70).blue
    puts "Welcome to the Makers Academy Student Database!".center(70).green
    puts   "---------------------------------------------".center(70).blue
    interactive_menu
end

def interactive_menu
	puts " "
	puts "Please select from the following options:".neon
	puts "
	'I' Input students to database
	'D' Display student database
	'L' Load student csv file
	'S' Save student list to file
	'X' Exit".yellow
	selections = gets.chomp
	selection = selections.upcase
	interactive_menu_case(selection)
end

def interactive_menu_case(selection)
	case selection
	when "I"
		user_input
	when "D"
		display_student_database(@students)
	when "S"
	    save_data	
	when "L"
		load_students
	when "X"
	else
		puts "No selection registered, please try again".red
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
	puts "Please enter the name of the student you'd like to add to the database \n".center(50).green
    name = gets.chomp
    
    puts "Please enter the cohort of the student you'd like to add to the database \n".center(50).green
    cohort_input = gets.chomp
    cohort = cohort_input.capitalize
    
    puts "Please enter the home city of the student you'd like to add to the database \n".center(50).green
    city = gets.chomp
    
    puts "Please enter the hobby of the student you'd like to add to the database \n".center(50).green
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
				puts "You did not enter a calendar month for your cohort, please try again!\n\n".red
				user_input
			else name.empty? && cohort.empty? && city.empty? && hobby.empty?
				#prompt when u haven´t entered all information, calls user_input
				puts "Please complete in all fields\n!".red
				list_or_continue
			end
end

def list_or_continue
	puts "For Student List, enter 'List' Or, to continue adding students, enter: 'Next'".center(50).red
	answer = gets.chomp
	#if user wants to make more entries hit return, to see list enter list, calls display_student_databaseer
	if answer.downcase == "list" ; return display_student_database(@students) end
	user_input
end

def makers_academy_header
    puts   "------------------------------".center(50).blue
    puts  "The Students Of Makers Academy!".center(50).green
    puts   "------------------------------".center(50).blue
end

def empty_list
	puts "Sorry, no entries have been entered so the list is empty!\n".center(50).red
	puts "To continue type 'continue', to quit type 'quit'".center(50).blue
	answer = gets.chomp
	case answer
		when "continue" 
		user_input
		when "quit"  
		else 
		puts "Error!".red
	end
end

def turnaround
	puts "\nTo continue editing the database type 'continue', to exit the program type 'quit'".center(50).red
	answer = gets.chomp
	case answer
		when "continue" 
		interactive_menu
		when "quit"  
		else 
		puts "Error!"
	end
end

def display_student_database(students=[])
	# puts students.inspect
	if students.size > 0 
	makers_academy_header
	sort_students = students.sort_by{|student| @months.index(student[:month])}
	sort_students.each_with_index{|student, counter| puts "#{counter + 1}. #{student[:month]} Cohort: #{student[:name]} from #{student[:city]} loves #{student[:hobby]}".yellow}
	save_data
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
        print "Overall, we have #{students.length} great students \n".center(50).green
    else
        print "\n"
        print "Overall, we have #{students.length} great student \n".center(50).green
    end
    turnaround
end


def save_data
    file = File.open("students.csv", "w") do |file|
    @students.each do |student|
    	student_data = [student[:name], student[:month], student[:city], student[:hobby]]
    	csv_line = student_data.join(",")
    	file.puts csv_line
    end
end
end 	

def load_file_check
	filename = ARGV.first

	#return if filename.nil?
	if !filename.nil? && File.exists?(filename) 
		load_students(filename)
		puts "successfully loaded file"
		interactive_menu
	else
		welcome
	end
end


def parse_file(line)
    month, name, city, hobby = line.split(',')
    @students << {month: month.to_sym, name: name, city: city, hobby: hobby}
end


def load_students(filename = "students.csv")
	File.open(filename, "r") do |file|
		file.readlines.each do |line| 
			parse_file(line)	
		end
	end
	interactive_menu
end

load_file_check

# Call the method for output #
welcome