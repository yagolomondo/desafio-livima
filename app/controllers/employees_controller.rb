class EmployeesController < ApplicationController
  before_action :set_employee, only: [:show, :edit, :update, :destroy]

  def index
    @employees = Employee.all
  end

  def show
  end

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.new(employee_params)
    @employee.save
    SlackNotifier::NOTIFIER.ping "#{@employee.name} entrou para empresa."
    redirect_to employee_path(@employee)
  end

  def edit
  end

  def update
    @employee.update(employee_params)
    redirect_to employee_path(@employee)
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
