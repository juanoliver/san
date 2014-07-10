class GraphicsController < ApplicationController
require 'rest_client'

attr_accessor :resp

  def esolar
      # leemos de una fuente rest y lo convertimos a JSON
      a = RestClient.get 'http://88.3.213.158/EL/json_pac.cgi'
      a = JSON.parse(a)
      
      # Para pasrlo al gráfico chartkick la serie de datos debe tener 
      # el siguinete formato
      #b = { "series" => ['serieA', 'serieB'], "datos" => {"serieA" => {1404892800 => 4480.0, 1504892800 => 3480.0}, "serieB" => {1404892800 => 3380.0, 1504892800 => 34480.0} } }
      # Creamos tres estructuras vacías
      c = {}
      d = {}
      ser = []
      # Procesamos primero las series y dejamos los datos vacíos 
      # Las series tipo tiempo no se procesan, solo se usan de etiquetas
      a['meta']['legend'].map do |s|  
        if (s !='time') then 
           ser << s 
           d[s]= {} 
        end
        c['series'] = ser
        c['datos'] = d
      end

      # Procesamos ahora las series de datos metemos precio, luego production
      # y luego consumo
      a['data'].map do |dat|
        time = Time.at(dat[0])
        c['datos']['precio'][time]=dat[1]
        c['datos']['production'][time]=dat[2]
        c['datos']['consumo'][time]=dat[3]
      end
      # devolvemos la estructura en un dato del objeto para que la vista 
      # la tenga accesible
      @resp = c
  end

  def psimulado
  end

  def hechos
  end

  def eventos
  end
end
