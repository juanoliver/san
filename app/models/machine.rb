class Machine < ActiveRecord::Base
  acts_as_gmappable
  def gmaps4rails_address
  "#{nombre_ciudad}, #{provincia}"
  end

end
