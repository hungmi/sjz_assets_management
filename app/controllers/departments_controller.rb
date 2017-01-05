class DepartmentsController < ApplicationController
  def index
    @departments = Department.all
  end

  def edit
    @department = Department.find(params[:id])
    render partial: "/departments/form", locals: { department: @department }
  end

  def update
    @department = Department.find(params[:id])
    if @department.update(department_params)
      render partial: @department
    else
      render json: @department.errors, status: :unprocessable_entity
    end
  end

  private

  def department_params
    params.require(:department).permit(:name)
  end
end