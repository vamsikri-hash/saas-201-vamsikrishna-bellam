class Section
 	attr_accessor :name,:num,:stud_list
 	def initialize(name)
 	  @name=name
 		self.stud_list=[]
 		self.num=0
 	end
 	def add(stud_name)
 		 @stud_list.push(stud_name)     
       @num+=1
     @stud_list = @stud_list.sort { |a, b| a <=> b }
      return (@stud_list.index(stud_name) + 1)
 	end
end