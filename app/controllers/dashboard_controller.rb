class DashboardController < ApplicationController
attr_accessor :resp
attr_accessor :resp2

  def dashboard
      # ALARMAS POR SEVERIDAD
      @resp = Alarm.all
      # FINALIZA ALARMAS POR SEVERIDAD
      # DISPOSITIVO MONIT VS NO MONIT
      @resp2 = Machine.all
      # FINALIZA MONIT VS NO MONIT
  end

end
