package Tipos_nuevos is

   subtype T_temp is Float range 0.0..100.0;       --Tipo encargado de manejar los datos de TEMPERATURA
   subtype T_wat is Float range 50.0..350.0;       --Tipo encargado de manejar los datos de WATIOS
   subtype T_volt is Float range 0.0..5.0;         --Tipo encargado de manejar los datos de VOLTIOS
   type tipoArrayTemp is array (1..15) of T_temp;  --Array en el que guardarán los datos tipo TEMPERATURA

end Tipos_nuevos;
