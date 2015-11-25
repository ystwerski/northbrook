class Api::V1::RotationsController < ApplicationController
  
  def index
    @beraishis = Parsha.where(:sefer_id => 1).sort
    @shemos = Parsha.where(:sefer_id => 2).sort
    @vayikrah = Parsha.where(:sefer_id => 3).sort
    @bamidbar = Parsha.where(:sefer_id => 4).sort
    @devorim = Parsha.where(:sefer_id => 5).sort 
    # @seforim = Sefer.all
    # @beraishis = []
    # @shemos = []
    # @vayikrah = []
    # @bamidbar = []
    # @devorim = []
    # @seforim.each do |sefer|
    #   parshious = sefer.parshas.sort
    #   parshious.each do |parsha|
    #     if parsha.sefer.name == "בראשית"
    #       @beraishis << parsha
    #     elsif parsha.sefer.name == "שמות"
    #       @shemos << parsha
    #     elsif parsha.sefer.name == "ויקרא"
    #       @vayikrah << parsha
    #     elsif parsha.sefer.name == "במדבר"
    #       @bamidbar << parsha
    #     elsif parsha.sefer.name == "דברים"
    #       @devorim << parsha
    #     end
    #   end
    # end
  end

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
  end

end