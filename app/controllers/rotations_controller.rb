class RotationsController < ApplicationController

  def index
    @parshious = Parsha.all
    @readers = Person.all
    # p @parshious
  end

  def create

  end

  def update

  end

  def destroy

  end

end
