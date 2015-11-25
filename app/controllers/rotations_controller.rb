class RotationsController < ApplicationController

  def index
    @parshious = Parsha.all
    @readers = Person.all
  end

  def create

  end

  def update

  end

  def destroy

  end

end
