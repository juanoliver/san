class StaticPagesController < ApplicationController
  skip_before_filter :authenticate_user!, :except => [:home ]

  def home
  end

  def help
  end

  def about
  end

  def machines
  end
  
  def grid
  end
end
