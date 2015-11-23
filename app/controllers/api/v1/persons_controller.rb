class Api::V1::PersonsController < ApplicationController

  def index
    @persons = Person.all
  end

  def show
    @person = Person.find(params[:id])
  end

  def create
  	@person = Person.new({
  	  :first_name => params["first_name"],
  	  :last_name => params["last_name"],
  	  :email => params[:email],
  	  :password => params[:password],
  	  :phone => params[:phone_number],
  	  :birthday => params[:birthday],
  	  :address => params[:address],
  	  :city => params[:city],
  	  :state => params[:state]
  	  })
  	if @person.save
  	  flash[:success] = "Congradulations! You have been successfully added to our database. To reserve a shabbos, simply click on the week that you wish to lain, and enter either your password and either your email or your phone number"
  	  # redirect_to api_v1_rotations_path
  	else
  	  render json: {errors: @person.errors.full_messages }, status: 422
  	end
  end

end