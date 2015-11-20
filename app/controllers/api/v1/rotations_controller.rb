class Api::V1::RotationsController < ApplicationController
  
  def index
  	@seforim = Sefer.all
  	@individual_sefarim = {}
  	@beraishis = []
  	@shemos = []
    @vayikrah = []
    @bamidbar = []
    @devorim = []
  	@seforim.each do |sefer|
      parshious = sefer.parshas
      parshious.each do |parsha|
        if parsha.sefer.name == "Beraishis"
          @beraishis << parsha
        elsif parsha.sefer.name == "Shemos"
        	@shemos << parsha
        elsif parsha.sefer.name == "Vayikrah"
        	@vayikrah << parsha
        elsif parsha.sefer.name == "Bamidbar"
        	@bamidbar << parsha
        elsif parsha.sefer.name == "Devorim"
        	@devorim << parsha
        end
      end
  	end
    # @parshious = Parsha.all
    # @Persons = Person.all
  end

end