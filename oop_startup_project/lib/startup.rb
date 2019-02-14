require "employee"

class Startup
    attr_reader :name, :funding, :salaries, :employees
    attr_writer :funding
    
    
    def initialize(name, funding, salaries)
       @name = name
       @funding = funding
       @salaries = {}
       salaries.each do |title, salary|
          @salaries[title] = salary
       end
       @employees = []
    end
    
    def valid_title?(title)
        if @salaries.has_key?(title)
            return true
        else
            return false
        end
    end
    
    def >(startup_1)
        startup_2 = Startup.new(startup_1.name, startup_1.funding, startup_1.salaries)
        if self.funding > startup_2.funding
            return true
        else
            return false
        end
    end 
    
    def hire(employee_name, title)
        if self.valid_title?(title)
            employee_1 = Employee.new(employee_name, title)
            @employees << employee_1
        else
            raise "error"
        end
    end
    
    def size
        @employees.length
    end
    
    def pay_employee(employee)
       amount = self.salaries[employee.title]
       if self.funding - amount > 0
           employee.pay(amount)
           self.funding -= amount
       else
           raise "error"
       end
    end
    
    def payday
       @employees.each do |employee|
           pay_employee(employee)
       end
    end
    
    def average_salary
        sum = 0
        @employees.each do |employee|
           sum += salaries[employee.title]  
        end
        return sum / @employees.length
    end
    
    def close
        @employees = []
        @funding = 0
    end
    
    def acquire(startup_1)
        amount = startup_1.funding
        @funding += amount
        startup_1.salaries.each do |title, salary|
           if @salaries.has_key?(title)
           else
               @salaries[title] = salary
           end
           
        end
        startup_1.employees.each do |employee|
           @employees << employee 
        end
        startup_1.close
    end
        
end
