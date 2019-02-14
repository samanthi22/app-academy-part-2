class Bootcamp
    def initialize(name, slogan, student_capacity)
       @name = name 
       @slogan = slogan
       @student_capacity = student_capacity
       @teachers = []
       @students = []
       @grades = Hash.new { |hash, key| hash[key] = [] }
    end
    
    def name
        @name
    end
    
    def slogan
        @slogan 
    end
    
    def student_capacity
        @student_capacity
    end
    
    def teachers
        @teachers
    end 
    
    def students
        @students
    end 
    
    def grades
        @grades
    end
    
    def hire(teacher)
        @teachers << teacher
    end
    
    def enroll(student)
        if @students.length < @student_capacity
            @students << student
            return true
        else
            return false
        end
    end
    
    def enrolled?(student)
        return @students.include?(student)
    end
    
    def student_to_teacher_ratio
        return @students.length / @teachers.length
    end 
    
    def add_grade(student, grade)
        if @students.include?(student)
        @grades[student] << grade
            return true
        else
            return false
        end
        
    end
    
    def num_grades(student)
        return @grades[student].length
        
    end 
    
    def average_grade(student)
        if @students.include?(student)
            if @grades[student].length != 0
                sum = 0
                @grades[student].each do |num|
                    sum += num 
                end
                return sum / @grades[student].length
            else
                return nil
            end
        else
            return nil
        end
    end
  
end
