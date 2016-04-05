class EmployeesController < ApplicationController
  def index
    @employees = Employee.all
    render "index.json.jbuilder"
  end

  def show
    @employee = Employee.find_by(id: params[:id])
    render "show.json.jbuilder"
  end

  def create
    @employee = Employee.create(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      birthdate: params[:birthdate],
      ssn: params[:ssn]
    )
    if @employee.save
      render "show.json.jbuilder"
      render json: {message: "Success!"}
    else
      render json: {message: "Could not create employee!"}
  end

  def update
    @employee = Employee.find_by(id: params[:id])
    @employee.update(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      birthdate: params[:birthdate],
      ssn: params[:ssn] 
    )
    if @employee.save
      render "show.json.jbuilder"
      render json: {message: "Success!"}
    else
      render json: {message: "Could not update employee!"}
  end

  def destroy
    @employee = Employee.find_by(id: params[:id])
    @employee.destroy
    render "show.json.jbuilder"
    render json: {message: "Destroyed!"}
  end
end
