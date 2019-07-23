require_relative './section'

class Department

 	attr_accessor :sections,:dept_name,:total
 	def initialize(name)
     @sections= ['A','B','C']
     self.sections[0] = Section.new "A"
      self.sections[1] = Section.new "B"
       self.sections[2] = Section.new "C"
        self.sections[3] = Section.new "D"

    
     self.total=0
      @dept_name=name
    end
    def enroll(student_name)
    	roll_no=0
    	sec_alot=""
    	if sections[0].num<10
    	 	roll_no=sections[0].add(student_name)
    	 	sec_alot='A'
        elsif sections[1].num<10
        	roll_no=sections[1].add(student_name)
        	sec_alot='B'
        else sections[2].num<10
        	roll_no=sections[2].add(student_name)
        	sec_alot='C'
        end
        @total+=1
        return "You have been allotted section #{sec_alot}"\
               "\nYour roll number is #{@dept_name}#{sec_alot}#{0}#{roll_no}"
      
    end
    

 end
