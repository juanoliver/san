class GraphicsController < ApplicationController
require 'rest_client'

attr_accessor :resp
attr_accessor :resp2

  def esolar
      # leemos de una fuente rest y lo convertimos a JSON
      a = RestClient.get 'http://88.3.213.158/EL/json_pac.cgi'
      a = JSON.parse(a)
      
      # Para pasrlo al gráfico chartkick la serie de datos debe tener 
      # el siguiente formato
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

  def cnxtrasp
      # leemos de una fuente rest y lo convertimos a JSON
      a = RestClient.get 'http://88.3.213.158/FA1/json_dircon.cgi?(get-fact-list)'
      @resp = JSON.parse(a)
      a = RestClient.get 'http://88.3.213.158/FA1/json_dircon.cgi?(get-defrule-list)'
      @resp2 = JSON.parse(a)
  end

  def psimulado
      # PRECIO: leemos de una fuente rest y lo convertimos a JSON
      a = RestClient.get 'http://88.3.213.158/EL/json_simfac.cgi?'
      a = JSON.parse(a)

      # Para pasrlo al gráfico chartkick la serie de datos debe tener 
      # el siguiente formato
      #b = { "series" => ['serieA'], "datos" => {"serieA" => {1404892800 => 4480.0, 1504892800 => 3480.0} } }
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
        c['datos']['fac'][time]=dat[1]
      end
      # devolvemos la estructura en un dato del objeto para que la vista 
      # la tenga accesible
      @resp = c
      #FINALIZA PRECIO

      # TEMPERATURA:leemos de una fuente rest y lo convertimos a JSON
      a = RestClient.get 'http://88.3.213.158/FA1/json_temp.cgi'
      a = JSON.parse(a)

      data_table = GoogleVisualr::DataTable.new
      data_table.new_column('string'  , 'Label')
      data_table.new_column('number'  , 'Value')
      data_table.add_rows(1)
      data_table.set_cell(0, 0, 'Temp1' )
      data_table.set_cell(0, 1, a['data'][0][1].round(2))

      opts   = { :width => 400, :height => 120, :redFrom => 90, :redTo => 100, :yellowFrom => 75, :yellowTo => 90, :minorTicks => 5 }
      @resp2 = GoogleVisualr::Interactive::Gauge.new(data_table, opts)
      
      data_table = GoogleVisualr::DataTable.new
      data_table.new_column('string'  , 'Label')
      data_table.new_column('number'  , 'Value')
      data_table.add_rows(1)
      data_table.set_cell(0, 0, 'Temp2' )
      data_table.set_cell(0, 1, a['data'][0][2].round(2))

      opts   = { :width => 400, :height => 120, :redFrom => 90, :redTo => 100, :yellowFrom => 75, :yellowTo => 90, :minorTicks => 5 }
      @resp3 = GoogleVisualr::Interactive::Gauge.new(data_table, opts)
      
      data_table = GoogleVisualr::DataTable.new
      data_table.new_column('string'  , 'Label')
      data_table.new_column('number'  , 'Value')
      data_table.add_rows(1)
      data_table.set_cell(0, 0, 'Temp3' )
      data_table.set_cell(0, 1, a['data'][0][3].round(2))

      opts   = { :width => 400, :height => 120, :redFrom => 90, :redTo => 100, :yellowFrom => 75, :yellowTo => 90, :minorTicks => 5 }
      @resp4 = GoogleVisualr::Interactive::Gauge.new(data_table, opts)
      
      data_table = GoogleVisualr::DataTable.new
      data_table.new_column('string'  , 'Label')
      data_table.new_column('number'  , 'Value')
      data_table.add_rows(1)
      data_table.set_cell(0, 0, 'Temp4' )
      data_table.set_cell(0, 1, a['data'][0][4].round(2))

      opts   = { :width => 400, :height => 120, :redFrom => 90, :redTo => 100, :yellowFrom => 75, :yellowTo => 90, :minorTicks => 5 }
      @resp5 = GoogleVisualr::Interactive::Gauge.new(data_table, opts)

      # FINALIZA TEMPERATURA
  end

end
