class Api::V2::EmployeesController < ApplicationController
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
  end

  def update
    @employee = Employee.find_by(id: params[:id])
    @employee.update(
      first_name: params[:first_name] || @employee.first_name,
      last_name: params[:last_name] || @employee.last_name,
      email: params[:email] || @employee.email,
      birthdate: params[:birthdate] || @employee.birthdate,
      ssn: params[:ssn] || @employee.ssn 
    )
    if @employee.save
      render "show.json.jbuilder"
      render json: {message: "Success!"}
    else
      render json: {message: "Could not update employee!"}
    end
  end

  def destroy
    @employee = Employee.find_by(id: params[:id])
    @employee.destroy
    render json: {message: "Destroyed!"}
  end
end
