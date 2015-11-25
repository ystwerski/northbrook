class Api::V1::RotationsController < ApplicationController
  
  def index
  	@seforim = Sefer.all
  	@beraishis = []
  	@shemos = []
    @vayikrah = []
    @bamidbar = []
    @devorim = []
  	@seforim.each do |sefer|
      parshious = sefer.parshas.sort
      parshious.each do |parsha|
        if parsha.sefer.name == "בראשית"
          @beraishis << parsha
        elsif parsha.sefer.name == "שמות"
        	@shemos << parsha
        elsif parsha.sefer.name == "ויקרא"
        	@vayikrah << parsha
        elsif parsha.sefer.name == "במדבר"
        	@bamidbar << parsha
        elsif parsha.sefer.name == "דברים"
        	@devorim << parsha
        end
      end
  	end
  end

  # def create
  # 	@person = Person.new({
  # 	  :first_name => params["first_name"],
  # 	  :last_name => params["last_name"],
  # 	  :email => params[:email],
  # 	  :password => params[:password],
  # 	  :phone => params[:phone_number],
  # 	  :birthday => params[:birthday],
  # 	  :address => params[:address],
  # 	  :city => params[:city],
  # 	  :state => params[:state]
  # 	  })
  # 	if @person.save
  # 	  flash[:success] = "Congradulations! You have been successfully added to our database. To reserve a shabbos, simply click on the week that you wish to lain, and enter either your password and either your email or your phone number"
  # 	  # redirect_to api_v1_rotations_path
  # 	else
  # 	  render json: {errors: @person.errors.full_messages }, status: 422
  # 	end
  # end

  def update
  	json_first_id = params["first_id"]
  	json_password = params["password"]
    @parsha = Parsha.find(params[:id])
    @person = Person.find_by(:password => json_password, :email => json_first_id)
    if @person && @parsha.available
      @parsha.update({
        :available => false,
        :person_id => @person.id
      })
    elsif @person && !@parsha.available
      if @parsha.person_id == @person.id
        @parsha.update({
          :available => true,
          :person_id => nil
        })
      else
        flash[:warning] = "Sorry, that parsha is already taken by someone else. Please choose a Parsha that is green, and avoid choosing the red ones."
      end
      flash[:success] = "Update successfull!"
    else
      flash[:warning] = "We didn't find you in our databanks. Please make sure you've typed in your information accurately. If you haven't signed up yet, click above where it says, 'create an accout'. If you can't remember your info, let us know and we'll email it to your listed email address."
    end
    # redirect_to api_v1_rotations_path
  end

end