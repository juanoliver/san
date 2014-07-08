class Machine < ActiveRecord::Base

def gmaps4rails_address
  "#{nombre_ciudad}, #{provincia}"
end

end
