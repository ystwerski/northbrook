class Api::V1::RotationsController < ApplicationController
  
  def index
    @parshious = Parsha.all
    @Persons = Person.all
  end

end