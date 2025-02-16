class EmployeesController < ApplicationController
    def index 
        @employees = Employee.all
    end 

    def new 
        @employee = Employee.new
    end 

    def show 
      @employee = Employee.find(params[:id])
    end

    def create 
        @employee = Employee.find(params[:id])
        @employee = Employee.new(employee_params)
        if @employee.valid?
            @employee.save

        redirect_to employee_path(@employee)

        else 

            render :new
        end 
    end 

    def edit
        @employee = Employee.find(params[:id])
    end 

    def update 
        @employee = Employee.find(params[:id])
        if @employee.update(employee_params)
            redirect_to employee_path(@employee)
        else 

            render :edit
        end 
    end 

    def destroy 
        @employee = Employee.find(params[:id])
        if @employee.destroy 
            redirect_to employees_path(@dog)
        else 
            render :edit 
        end 
    end 

    private

    # def dog_id
    #     @dog = Dog.find(params[:id])
    # end 

    def employee_params
        params.require(:employee).permit(:first_name, :last_name, :alias, :title, :office, :dog_id, :img_url)
    end 
end 

