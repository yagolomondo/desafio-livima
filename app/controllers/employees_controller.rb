class EmployeesController < ApplicationController
  before_action :set_employee, only: [:show, :edit, :update, :destroy]

  def index
    if params[:name].present?
      @employees = Employee.search_name("#{params[:name]}")
    else
      @employees = Employee.all
    end
  end

  def show
  end

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.new(employee_params)
    if @employee.save
      SlackNotifier::NOTIFIER.ping "#{@employee.name} entrou para empresa."
      redirect_to employee_path(@employee)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @employee.update(employee_params)
      redirect_to employee_path(@employee)
    else
      render :edit
    end
  end

  def destroy
    @employee.destroy
    SlackNotifier::NOTIFIER.ping "#{@employee.name} saiu da empresa."
    redirect_to employees_path
  end

  private

  def set_employee
    @employee = Employee.find(params[:id])
  end

  def employee_params
    params.require(:employee).permit(:name, :email, :role, :salary)
  end
end
