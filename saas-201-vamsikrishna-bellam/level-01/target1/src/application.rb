# require './department' # Include other files in the same directory
require_relative './department'

# Your application
class Application
 attr_accessor :departments

  def initialize
    @departments=['EEE', 'MECH', 'CSE', 'CIVIL']
     self.departments[0] = Department.new "EEE"
     self.departments[1] = Department.new "MECH"
     self.departments[2] = Department.new "CSE"
     self.departments[3]= Department.new "CIVIL"
  end

  def enroll(student_name, student_department)
    # This is a sample implementation. you can write your own code
    if student_name.to_s.strip.empty? || student_department.to_s.strip.empty?
    	return "Sorry! you entered your name or department empty"
    else
     departments.each do |dept|
       if(dept.dept_name==student_department)
          if(dept.total<30)
            return "You have been enrolled to #{student_department}\n#{dept.enroll student_name}"
          else
            return "Error: Seats are not available in #{student_department}"
          end
        end
     end
    end
    
    
  end

  def change_dept(student_name, student_department)
    ## write some logic to frame the string below
    
    if student_get_dept(student_name)==student_department || student_department.to_s.strip.empty?
    	return "you entered the same department! Sorry OR you entered an empty string!"
    else

     departments.each do |dept|
      dept.sections.each do |sec|
        sec.stud_list.delete(student_name)
        sec.stud_list.sort
        
      end
     end
       return enroll(student_name,student_department)
    end
    
  end

  def change_section(student_name, section)
    aloted_dep=''
    if student_get_sec(student_name)==section || section.to_s.strip.empty? || student_name.to_s.strip.empty?
    	return "Sorry! you entered same section or your entered empty string!"
    else

     departments.each do |dept|
      dept.sections.each do |sec|
        sec.stud_list.each do|stu|
          if(stu==student_name)
            sec.stud_list.delete(student_name)
            sec.stud_list.sort
            aloted_dep=dept.dept_name
          end
        end
      end
     end
     departments.each do |dept|
          dept.sections.each do |sec|
              if(section==sec.name and dept.dept_name==aloted_dep)
                sec.stud_list.push(student_name)
                sec.stud_list.sort
                str="You have been allotted section #{section}"
                return "#{str}\nYour roll number is #{dept.dept_name}#{section}#{0}#{sec.stud_list.index(student_name)+1}"
              end
          end
          
      end
    end
         
  end
      

    
  

  def department_view(student_dept)
    ## write some logic to frame the string below
    if student_dept.to_s.strip.empty?
    	return "you entered empty string OR Invalid department" 
    else
     a = ''
            if(student_dept == "EEE")
                a=departments[0]
            elsif(student_dept == "MECH")
                a=departments[1]
            elsif(student_dept == "CSE")
                a=departments[2]
            elsif(student_dept == "CIVIL")
                   a=departments[3]
            end

      str = "List of students:"
      a.sections.each do |s|
        s.stud_list.each do |stu|
          str+="\n#{stu} - #{student_dept}#{s.name}#{0}#{s.stud_list.index(stu)+1}"
        end
      end  
      return str
    end
  end

  def section_view(student_dept, section)
    ## write some logic to frame the string below
    if student_dept.to_s.strip.empty? || section.to_s.strip.empty?
    	return "you entered empty department or section!"
    else
     a = ''
            if(student_dept == "EEE")
                a=departments[0]
            elsif(student_dept == "MECH")
                a=departments[1]
            elsif(student_dept == "CSE")
                a=departments[2]
            elsif(student_dept == "CIVIL")
                   a=departments[3]
            
            end
            str="List of students:"

          a.sections.each do |s|
            if(s.name==section)
              s.stud_list.each do |stu|
              str+="\n#{stu} - #{student_dept}#{s.name}#{0}#{s.stud_list.index(stu)+1}"
              end
            
              
            
            end
          end
          return str
    end
  end

   

  

  def student_details(student_name)
    ## write some logic to frame the string below
    if student_name.to_s.strip.empty?
    	return " Sorry you entered empty name!"
    else
     str=''
            
        departments.each do |dept|
          dept.sections.each do |sec|
              sec.stud_list.each do |stu|
                if(stu==student_name)
                 str="#{student_name} - #{dept.dept_name} - Section #{sec.name} - #{dept.dept_name}#{sec.name}#{0}#{sec.stud_list.index(student_name)+1}"
                else
                	str="you enterd a name not in the list"
              
                end
            end
          end
        end
          return str
    end



  end


  def student_get_dept(student_name)
    ## write some logic to frame the string below
     str=''
            
        departments.each do |dept|
          dept.sections.each do |sec|
              sec.stud_list.each do |stu|
                if(stu==student_name)
                 str="#{dept.dept_name}"
              
             end
            end
          end
        end
          return str



  end



  def student_get_sec(student_name)
    ## write some logic to frame the string below
     str=''
            
        departments.each do |dept|
          dept.sections.each do |sec|
              sec.stud_list.each do |stu|
                if(stu==student_name)
                 str="#{sec.name}"
              
             end
            end
          end
        end
          return str



  end


end
